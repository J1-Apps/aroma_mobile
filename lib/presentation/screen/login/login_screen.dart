import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/login/login_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/login_event.dart";
import "package:aroma_mobile/presentation/bloc/login/login_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/screen/login/login_loading.dart";
import "package:aroma_mobile/presentation/screen/login/login_scaffold.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScaffold(child: _LoginContent());
  }
}

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      listenWhen: (previous, current) => previous.error != current.error && current.error != null,
      listener: (context, state) => _showErrorToast(context, state.error),
      builder: (context, state) => state.isLoading ? const LoginLoading() : const _LoginForm(),
    );
  }
}

void _showErrorToast(BuildContext context, ErrorCode? error) {
  final strings = context.strings();

  final message = switch (error) {
    ErrorCode.source_remote_auth_googleSignInFailed => strings.login_login_googleSignInFailed,
    _ => null,
  };

  if (message != null) {
    context.showJToastWithText(text: message, hasClose: true);
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

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
          _LoginDivider(),
          SizedBox(height: JDimens.spacing_m),
          _ProviderLogin(),
          SizedBox(height: JDimens.spacing_m),
          _LoginTerms(),
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
      text: context.strings().login_login_loginButton,
      onPressed: () => context.navigate(AromaRoute.signIn.build(const EmptyRouteConfig())),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return JTextButton(
      text: context.strings().login_login_registerButton,
      onPressed: () => context.navigate(AromaRoute.signUp.build(const EmptyRouteConfig())),
      color: JWidgetColor.secondary,
    );
  }
}

class _LoginDivider extends StatelessWidget {
  const _LoginDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: JDimens.spacing_xs),
        const Expanded(child: Divider()),
        const SizedBox(width: JDimens.spacing_xs),
        Text(context.strings().login_login_loginWith, style: context.textTheme().bodySmall),
        const SizedBox(width: JDimens.spacing_xs),
        const Expanded(child: Divider()),
        const SizedBox(width: JDimens.spacing_xs),
      ],
    );
  }
}

class _ProviderLogin extends StatelessWidget {
  const _ProviderLogin();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: JDimens.spacing_s),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          JIconButton(
            icon: JamIcons.google,
            size: JWidgetSize.large,
            onPressed: () => context.read<LoginBloc>().add(const LoginEventSignInWithGoogle()),
          ),
          JIconButton(
            icon: JamIcons.apple,
            size: JWidgetSize.large,
            onPressed: () {
              // TODO: Implement apple login
              context.showJToastWithText(text: "Apple login is not available yet", hasClose: true);
            },
          ),
          JIconButton(
            icon: JamIcons.facebook,
            size: JWidgetSize.large,
            onPressed: () {
              // TODO: Implement facebook login
              context.showJToastWithText(text: "Facebook login is not available yet", hasClose: true);
            },
          ),
          JIconButton(
            icon: JamIcons.github,
            size: JWidgetSize.large,
            onPressed: () {
              // TODO: Implement github login
              context.showJToastWithText(text: "Github login is not available yet", hasClose: true);
            },
          ),
        ],
      ),
    );
  }
}

class _LoginTerms extends StatelessWidget {
  const _LoginTerms();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();
    final text = context.textTheme();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: JDimens.spacing_xxl),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: strings.login_login_disclaimers,
              style: text.bodySmall,
            ),
            TextSpan(
              text: strings.login_login_termsOfUse,
              style: text.bodySmall?.copyWith(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = () => _viewTermsOfUse(context),
            ),
            TextSpan(
              text: strings.login_login_and,
              style: text.bodySmall,
            ),
            TextSpan(
              text: strings.login_login_privacyPolicy,
              style: text.bodySmall?.copyWith(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = () => _viewPrivacyPolicy(context),
            ),
          ],
        ),
      ),
    );
  }
}

void _viewTermsOfUse(BuildContext context) {
  // TODO: Implement terms of use
  context.showJToastWithText(text: "Terms of use", hasClose: true);
}

void _viewPrivacyPolicy(BuildContext context) {
  // TODO: Implement privacy policy
  context.showJToastWithText(text: "Privacy policy", hasClose: true);
}
