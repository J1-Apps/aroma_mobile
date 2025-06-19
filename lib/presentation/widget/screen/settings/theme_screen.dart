import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/util/theme/aroma_theme.dart";
import "package:aroma_mobile/presentation/widget/common/aroma_back_button.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(
        title: context.strings().theme_title,
        titleStyle: context.textTheme().headlineSmall,
        leadingAction: context.canPop() ? const AromaBackButton() : null,
      ),
      body: const _ThemeContent(),
    );
  }
}

class _ThemeContent extends StatelessWidget {
  const _ThemeContent();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();
    final fonts = context.textTheme();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: JDimens.spacing_s),
        _ThemeCarousel(children: AromaColorScheme.values.map((colors) => _ColorCard(colors: colors)).toList()),
        const SizedBox(height: JDimens.spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: JDimens.spacing_m),
          child: Text(strings.theme_headerFonts, style: fonts.headlineSmall),
        ),
        const SizedBox(height: JDimens.spacing_xs),
        _ThemeCarousel(children: AromaFontFamily.values.map((font) => _HeaderFontCard(font: font)).toList()),
        const SizedBox(height: JDimens.spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: JDimens.spacing_m),
          child: Text(strings.theme_bodyFonts, style: fonts.headlineSmall),
        ),
        const SizedBox(height: JDimens.spacing_xs),
        _ThemeCarousel(children: AromaFontFamily.values.map((font) => _BodyFontCard(font: font)).toList()),
        const SizedBox(height: JDimens.spacing_xxl),
      ],
    );
  }
}

class _ThemeCarousel extends StatelessWidget {
  final List<Widget> children;

  const _ThemeCarousel({required this.children});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: JDimens.spacing_m),
        child: Row(
          spacing: JDimens.spacing_s,
          children: children,
        ),
      ),
    );
  }
}

class _ColorCard extends StatelessWidget {
  final AromaColorScheme colors;

  const _ColorCard({required this.colors});

  @override
  Widget build(BuildContext context) {
    return JThemeCard(
      themeName: context.strings().theme_colorsTitle(colors.name),
      colors: colors.scheme.toMaterial(),
      fonts: context.textTheme(),
      onPressed: () => context.read<J1ThemeBloc>().add(UpdateColorSchemeEvent(colors.scheme)),
    );
  }
}

class _HeaderFontCard extends StatelessWidget {
  final AromaFontFamily font;

  const _HeaderFontCard({required this.font});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<J1ThemeBloc, J1ThemeState, J1TextTheme>(
      selector: (state) => state.textTheme,
      builder: (context, fonts) => JFontCard(
        fontName: context.strings().theme_fontTitle(font.name),
        styles: [
          J1TextStyle.headlineMedium(fontFamily: font.fontFamily).toMaterial(),
          J1TextStyle.titleMedium(fontFamily: font.fontFamily).toMaterial(),
        ],
        onPressed: () => context.read<J1ThemeBloc>().add(
          UpdateTextThemeEvent(fonts.copyWithHeaderFont(font.fontFamily)),
        ),
      ),
    );
  }
}

class _BodyFontCard extends StatelessWidget {
  final AromaFontFamily font;

  const _BodyFontCard({required this.font});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<J1ThemeBloc, J1ThemeState, J1TextTheme>(
      selector: (state) => state.textTheme,
      builder: (context, fonts) => JFontCard(
        fontName: context.strings().theme_fontTitle(font.name),
        styles: [
          J1TextStyle.bodyLarge(fontFamily: font.fontFamily).toMaterial(),
          J1TextStyle.bodyMedium(fontFamily: font.fontFamily).toMaterial(),
          J1TextStyle.bodySmall(fontFamily: font.fontFamily).toMaterial(),
        ],
        onPressed: () => context.read<J1ThemeBloc>().add(
          UpdateTextThemeEvent(fonts.copyWithBodyFont(font.fontFamily)),
        ),
      ),
    );
  }
}
