import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_event.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/screen/login/login_loading.dart";
import "package:aroma_mobile/presentation/screen/login/login_scaffold.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class ResetPasswordScreen extends StatelessWidget {
  final String initialEmail;

  const ResetPasswordScreen({
    this.initialEmail = "",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      child: _ResetPasswordContent(
        initialEmail: initialEmail,
      ),
    );
  }
}

class _ResetPasswordContent extends StatelessWidget {
  final String initialEmail;

  const _ResetPasswordContent({required this.initialEmail});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      listenWhen: (previous, current) => previous.error != current.error && current.error != null,
      listener: (context, state) => _showErrorToast(context, state.error),
      builder: (context, state) => state.isLoading
          ? const LoginLoading()
          : _ResetPasswordForm(
              initialEmail: initialEmail,
            ),
    );
  }
}

void _showErrorToast(BuildContext context, ErrorCode? error) {
  final strings = context.strings();

  final message = switch (error) {
    ErrorCode.source_remote_auth_sendPasswordResetEmailFailed => strings.resetPassword_sendPasswordResetEmailFailed,
    _ => null,
  };

  if (message != null) {
    context.showJToastWithText(text: message, hasClose: true);
  }
}

class _ResetPasswordForm extends StatefulWidget {
  final String initialEmail;

  const _ResetPasswordForm({required this.initialEmail});

  @override
  State<StatefulWidget> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<_ResetPasswordForm> {
  late final TextEditingController _emailController;

  String? _emailError;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController(text: widget.initialEmail);

    _emailController.addListener(() => setState(() => _emailError = null));
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: JDimens.spacing_m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _EmailField(
            controller: _emailController,
            errorText: _emailError,
          ),
          const SizedBox(height: JDimens.spacing_s),
          JTextButton(
            text: strings.resetPassword_resetPassword,
            onPressed: () => context.read<ResetPasswordBloc>().add(
              ResetPasswordEventResetPassword(
                email: _emailController.text,
              ),
            ),
          ),
          const SizedBox(height: JDimens.spacing_m),
          _SignIn(
            onPressed: () => context.navigate(
              AromaRoute.signIn.build(
                EmailPasswordRouteConfig(
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

class _SignIn extends StatelessWidget {
  final VoidCallback onPressed;

  const _SignIn({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          strings.resetPassword_signInPrompt,
          style: context.textTheme().bodyMedium,
        ),
        JTextButton(
          text: strings.resetPassword_signInCta,
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
