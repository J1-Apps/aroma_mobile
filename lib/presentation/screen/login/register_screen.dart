import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/login/register_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/register_event.dart";
import "package:aroma_mobile/presentation/bloc/login/register_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/screen/login/login_loading.dart";
import "package:aroma_mobile/presentation/screen/login/login_scaffold.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class RegisterScreen extends StatelessWidget {
  final String initialEmail;
  final String initialPassword;

  const RegisterScreen({
    this.initialEmail = "",
    this.initialPassword = "",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      child: _RegisterContent(
        initialEmail: initialEmail,
        initialPassword: initialPassword,
      ),
    );
  }
}

class _RegisterContent extends StatelessWidget {
  final String initialEmail;
  final String initialPassword;

  const _RegisterContent({
    required this.initialEmail,
    required this.initialPassword,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      listenWhen: (previous, current) => previous.error != current.error && current.error != null,
      listener: (context, state) => _showErrorToast(context, state.error),
      builder: (context, state) => state.isLoading
          ? const LoginLoading()
          : _RegisterForm(
              initialEmail: initialEmail,
              initialPassword: initialPassword,
            ),
    );
  }
}

void _showErrorToast(BuildContext context, ErrorCode? error) {
  final strings = context.strings();

  final message = switch (error) {
    ErrorCode.source_remote_auth_emailSignUpFailed => strings.register_emailSignUpFailed,
    _ => null,
  };

  if (message != null) {
    context.showJToastWithText(text: message, hasClose: true);
  }
}

class _RegisterForm extends StatefulWidget {
  final String initialEmail;
  final String initialPassword;

  const _RegisterForm({
    required this.initialEmail,
    required this.initialPassword,
  });

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmController;

  bool _showPassword = false;

  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController(text: widget.initialEmail);
    _passwordController = TextEditingController(text: widget.initialPassword);
    _confirmController = TextEditingController();

    _emailController.addListener(() => setState(() => _emailError = null));
    _passwordController.addListener(() => setState(() => _passwordError = null));
    _confirmController.addListener(() => setState(() => _passwordError = null));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: JDimens.spacing_m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // TODO: Get email error text
          _EmailField(
            controller: _emailController,
            errorText: _emailError,
          ),
          const SizedBox(height: JDimens.spacing_s),
          // TODO: Get password error text
          _PasswordField(
            controller: _passwordController,
            errorText: _passwordError,
            showPassword: _showPassword,
            toggleShowPassword: () => setState(() => _showPassword = !_showPassword),
          ),
          const SizedBox(height: JDimens.spacing_s),
          // TODO: Get confirm password error text
          _ConfirmPasswordField(
            controller: _confirmController,
            errorText: _passwordError,
            showPassword: _showPassword,
          ),
          const SizedBox(height: JDimens.spacing_s),
          _RegisterButton(
            onPressed: () {
              if (_passwordController.text != _confirmController.text) {
                setState(() => _passwordError = context.strings().register_passwordMismatch);
                return;
              }

              context.read<RegisterBloc>().add(
                RegisterEventSignUpWithEmail(
                  email: _emailController.text,
                  password: _passwordController.text,
                ),
              );
            },
          ),
          const SizedBox(height: JDimens.spacing_m),
          _SignIn(
            onPressed: () => context.navigate(
              AromaRoute.signIn.build(
                EmailPasswordRouteConfig(
                  email: _emailController.text,
                  password: _passwordController.text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }
}

class _EmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;

  const _EmailField({
    required this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return JTextField(
      controller: controller,
      name: strings.register_emailLabel,
      hint: strings.register_emailLabel,
      errorText: errorText,
      showErrorText: true,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final bool showPassword;
  final VoidCallback toggleShowPassword;

  const _PasswordField({
    required this.controller,
    this.errorText,
    required this.showPassword,
    required this.toggleShowPassword,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return JTextField(
      controller: controller,
      name: strings.register_passwordLabel,
      hint: strings.register_passwordLabel,
      errorText: errorText,
      showErrorText: true,
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      obscureText: !showPassword,
      icon: showPassword ? JamIcons.eyeclosed : JamIcons.eye,
      onIconPressed: toggleShowPassword,
    );
  }
}

class _ConfirmPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final bool showPassword;

  const _ConfirmPasswordField({
    required this.controller,
    this.errorText,
    required this.showPassword,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return JTextField(
      controller: controller,
      name: strings.register_confirmPasswordLabel,
      hint: strings.register_confirmPasswordLabel,
      errorText: errorText,
      showErrorText: true,
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      obscureText: !showPassword,
    );
  }
}

class _RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _RegisterButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return JTextButton(
      text: context.strings().register_registerButton,
      onPressed: onPressed,
    );
  }
}

class _SignIn extends StatelessWidget {
  final VoidCallback onPressed;

  const _SignIn({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.strings().register_signInPrompt,
          style: context.textTheme().bodyMedium,
        ),
        JTextButton(
          text: context.strings().register_signInCta,
          forceCaps: false,
          size: JWidgetSize.small,
          type: JButtonType.flat,
          color: JWidgetColor.tertiary,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
