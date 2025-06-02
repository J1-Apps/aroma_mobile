import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_event.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/screen/login/login_loading.dart";
import "package:aroma_mobile/presentation/screen/login/login_scaffold.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class SignInScreen extends StatelessWidget {
  final String initialEmail;
  final String initialPassword;

  const SignInScreen({
    super.key,
    this.initialEmail = "",
    this.initialPassword = "",
  });

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      child: _SignInContent(
        initialEmail: initialEmail,
        initialPassword: initialPassword,
      ),
    );
  }
}

class _SignInContent extends StatelessWidget {
  final String initialEmail;
  final String initialPassword;

  const _SignInContent({
    required this.initialEmail,
    required this.initialPassword,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      listenWhen: (previous, current) => previous.error != current.error && current.error != null,
      listener: (context, state) => _showErrorToast(context, state.error),
      builder: (context, state) => state.isLoading
          ? const LoginLoading()
          : _SignInForm(
              initialEmail: initialEmail,
              initialPassword: initialPassword,
            ),
    );
  }
}

void _showErrorToast(BuildContext context, ErrorCode? error) {
  final strings = context.strings();

  final message = switch (error) {
    ErrorCode.source_remote_auth_emailSignInFailed => strings.signIn_emailSignInFailed,
    _ => null,
  };

  if (message != null) {
    context.showJToastWithText(text: message, hasClose: true);
  }
}

class _SignInForm extends StatefulWidget {
  final String initialEmail;
  final String initialPassword;

  const _SignInForm({
    required this.initialEmail,
    required this.initialPassword,
  });

  @override
  State<StatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController(text: widget.initialEmail);
    _passwordController = TextEditingController(text: widget.initialPassword);

    _emailController.addListener(() => setState(() => _emailError = null));
    _passwordController.addListener(() => setState(() => _passwordError = null));
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
          ),
          const SizedBox(height: JDimens.spacing_s),
          _LoginButton(
            onPressed: () => context.read<SignInBloc>().add(
              SignInEventSignInWithEmail(
                email: _emailController.text,
                password: _passwordController.text,
              ),
            ),
          ),
          const SizedBox(height: JDimens.spacing_s),
          _RegisterButton(
            onPressed: () => context.navigate(
              AromaRoute.signUp.build(
                EmailPasswordRouteConfig(
                  email: _emailController.text,
                  password: _passwordController.text,
                ),
              ),
            ),
          ),
          const SizedBox(height: JDimens.spacing_m),
          _ResetPassword(
            onPressed: () => context.navigate(
              AromaRoute.resetPassword.build(
                EmailRouteConfig(
                  email: _emailController.text,
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
      name: strings.signIn_emailLabel,
      hint: strings.signIn_emailLabel,
      errorText: errorText,
      showErrorText: true,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;

  const _PasswordField({
    required this.controller,
    this.errorText,
  });

  @override
  State<StatefulWidget> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _showPassword = false;
  String? _errorText;

  @override
  void initState() {
    _errorText = widget.errorText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return JTextField(
      controller: widget.controller,
      name: strings.signIn_passwordLabel,
      hint: strings.signIn_passwordLabel,
      errorText: _errorText,
      showErrorText: true,
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      obscureText: !_showPassword,
      icon: _showPassword ? JamIcons.eyeclosed : JamIcons.eye,
      onIconPressed: () => setState(() => _showPassword = !_showPassword),
    );
  }

  @override
  void didUpdateWidget(covariant _PasswordField oldWidget) {
    _errorText = widget.errorText;
    super.didUpdateWidget(oldWidget);
  }
}

class _LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _LoginButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return JTextButton(
      text: context.strings().signIn_loginButton,
      onPressed: onPressed,
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
      text: context.strings().signIn_registerButton,
      color: JWidgetColor.secondary,
      onPressed: onPressed,
    );
  }
}

class _ResetPassword extends StatelessWidget {
  final VoidCallback onPressed;

  const _ResetPassword({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          strings.signIn_resetPasswordPrompt,
          style: context.textTheme().bodyMedium,
        ),
        JTextButton(
          text: strings.signIn_resetPasswordCta,
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
