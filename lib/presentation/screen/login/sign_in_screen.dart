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
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScaffold(child: _SignInContent());
  }
}

class _SignInContent extends StatelessWidget {
  const _SignInContent();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      listenWhen: (previous, current) => previous.error != current.error && current.error != null,
      listener: (context, state) => _showErrorToast(context, state.error),
      builder: (context, state) => state.isLoading ? const LoginLoading() : const _SignInForm(),
    );
  }
}

void _showErrorToast(BuildContext context, ErrorCode? error) {
  final strings = context.strings();

  final message = switch (error) {
    ErrorCode.source_remote_auth_emailSignInFailed => strings.login_signIn_emailSignInFailed,
    _ => null,
  };

  if (message != null) {
    context.showJToastWithText(text: message, hasClose: true);
  }
}

class _SignInForm extends StatelessWidget {
  const _SignInForm();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(JDimens.spacing_m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _LoginButton(),
          SizedBox(height: JDimens.spacing_s),
          _RegisterButton(),
          SizedBox(height: JDimens.spacing_m),
          _ResetPassword(),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return JTextButton(
      text: context.strings().login_signIn_loginButton,
      onPressed: () => context.read<SignInBloc>().add(
        // TODO: Get email and password from form
        const SignInEventSignInWithEmail(
          email: "test@test.com",
          password: "password",
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return JTextButton(
      text: context.strings().login_signIn_registerButton,
      color: JWidgetColor.secondary,
      // TODO: Get email and password from form
      onPressed: () => context.navigate(AromaRoute.signUp.build(const EmptyRouteConfig())),
    );
  }
}

class _ResetPassword extends StatelessWidget {
  const _ResetPassword();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          strings.login_signIn_resetPasswordPrompt,
          style: context.textTheme().bodyMedium,
        ),
        JTextButton(
          text: strings.login_signIn_resetPasswordCta,
          forceCaps: false,
          size: JWidgetSize.small,
          type: JButtonType.flat,
          onPressed: () => context.navigate(AromaRoute.resetPassword.build(const EmptyRouteConfig())),
        ),
      ],
    );
  }
}
