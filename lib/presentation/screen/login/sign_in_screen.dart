import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_state.dart";
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
    return const Center(child: Text("Sign In"));
  }
}
