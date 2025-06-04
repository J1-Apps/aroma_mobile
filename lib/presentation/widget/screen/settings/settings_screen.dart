import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_bloc.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_event.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/widget/common/aroma_back_button.dart";
import "package:aroma_mobile/presentation/widget/screen/settings/select_language_drawer.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return Scaffold(
      appBar: JAppBar(
        title: strings.settings_title,
        titleStyle: context.textTheme().headlineLarge,
        leadingAction: context.canPop() ? const AromaBackButton() : null,
      ),
      body: BlocListener<SettingsBloc, SettingsState>(
        listenWhen: (previous, current) => previous.error != current.error && current.error != null,
        listener: _listenErrors,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SettingsItem(
              icon: JamIcons.language,
              label: strings.settings_language,
              trailingItem: const _LanguageSwitcher(),
              onPressed: () => context.showJBottomSheet(
                child: SelectLanguageDrawer(bloc: context.read<SettingsBloc>()),
                scrollControlDisabledMaxHeightRatio: selectLanguageDrawerHeightRatio,
              ),
            ),
            _SettingsItem(
              icon: JamIcons.paintbrush,
              label: strings.settings_theme,
              onPressed: () => context.navigate(AromaRoute.theme.build(const EmptyRouteConfig())),
            ),
            const SizedBox(height: JDimens.spacing_l),
            const _SignOutButton(),
          ],
        ),
      ),
    );
  }
}

void _listenErrors(BuildContext context, SettingsState state) {
  final strings = context.strings();

  final message = switch (state.error) {
    ErrorCode.source_local_language_readError => strings.settings_error_getLanguage,
    ErrorCode.source_local_language_writeError => strings.settings_error_saveLanguage,
    ErrorCode.source_remote_auth_signOutFailed => strings.settings_error_signOut,
    _ => null,
  };

  if (message != null) {
    context.showJToastWithText(text: message, hasClose: true);
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final Widget? trailingItem;

  const _SettingsItem({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.trailingItem,
  });

  @override
  Widget build(BuildContext context) {
    return JListItem(
      padding: const EdgeInsets.symmetric(horizontal: JDimens.spacing_m, vertical: JDimens.spacing_s),
      onPressed: onPressed,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            const SizedBox(width: JDimens.spacing_xs),
            Text(label, style: context.textTheme().headlineSmall),
          ],
        ),
        trailingItem ?? const Icon(JamIcons.chevronright),
      ],
    );
  }
}

class _LanguageSwitcher extends StatelessWidget {
  const _LanguageSwitcher();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme();
    final strings = context.strings();

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) => previous.language != current.language,
      builder: (context, state) {
        final language = state.language;

        if (language == null) {
          return const JLoadingIndicator();
        } else {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(strings.settings_languageLabel(language), style: textTheme.titleMedium),
              const SizedBox(width: JDimens.spacing_xs),
              Icon(JamIcons.chevrondown, size: JDimens.size_16),
            ],
          );
        }
      },
    );
  }
}

class _SignOutButton extends StatelessWidget {
  const _SignOutButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: JDimens.spacing_m),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) => previous.isSigningOut != current.isSigningOut,
        builder: (context, state) {
          final isSigningOut = state.isSigningOut;

          return isSigningOut
              ? const Center(child: JLoadingIndicator())
              : JTextButton(
                  text: context.strings().settings_logout,
                  type: JButtonType.flat,
                  color: JWidgetColor.onSurface,
                  size: JWidgetSize.small,
                  onPressed: () => context.read<SettingsBloc>().add(const SettingsEventSignOut()),
                  overrides: JTextButtonOverrides(
                    outlineColor: context.colorScheme().onSurface,
                  ),
                );
        },
      ),
    );
  }
}
