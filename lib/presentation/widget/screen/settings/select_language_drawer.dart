import "package:aroma_mobile/presentation/bloc/settings/settings_bloc.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_event.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_state.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/util/localization/app_localizations.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

const selectLanguageDrawerHeightRatio = 0.8;
const supportedLocales = Strings.supportedLocales;

class SelectLanguageDrawer extends StatefulWidget {
  final SettingsBloc bloc;

  const SelectLanguageDrawer({
    required this.bloc,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => SelectLanguageDrawerState();
}

class SelectLanguageDrawerState extends State<SelectLanguageDrawer> {
  var query = "";

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();
    final filteredOptions = query.isEmpty
        ? supportedLocales
        : _filterQuery(
            supportedLocales,
            query.toLowerCase(),
            strings,
          );

    return BlocProvider.value(
      value: widget.bloc,
      child: Padding(
        padding: const EdgeInsets.only(
          left: JDimens.spacing_m,
          top: JDimens.spacing_m,
          right: JDimens.spacing_m,
        ),
        child: Column(
          children: [
            JTextField(
              type: JTextFieldType.underlined,
              size: JWidgetSize.large,
              hint: strings.settings_languageHint,
              onChanged: (value) => setState(() => query = value),
              autocorrect: false,
              icon: JamIcons.search,
            ),
            Expanded(
              child: BlocSelector<SettingsBloc, SettingsState, String>(
                selector: (state) => state.language ?? "",
                builder: (context, language) => _SelectLanguageList(
                  strings: strings,
                  selectedLocale: language,
                  options: filteredOptions,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Locale> _filterQuery(List<Locale> original, String query, Strings strings) {
  return original.where((locale) {
    final language = locale.languageCode.toLowerCase();
    return language.contains(query) || strings.settings_languageLabel(language).toLowerCase().contains(query);
  }).toList();
}

class _SelectLanguageList extends StatelessWidget {
  final Strings strings;
  final String selectedLocale;
  final List<Locale> options;

  const _SelectLanguageList({
    required this.strings,
    required this.selectedLocale,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    final items = _createItems(selectedLocale, options);

    if (items.length == 2) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: JDimens.spacing_m, vertical: JDimens.spacing_xl),
        child: JErrorMessage(message: strings.settings_error_languageEmpty),
      );
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index].build(context),
    );
  }
}

List<_SelectLanguageDrawerItem> _createItems(
  String selectedLocale,
  List<Locale> options,
) {
  return [
    const _SelectCurrencyPaddingItem(height: JDimens.spacing_s),
    for (final locale in options)
      _SelectLanguageCardItem(
        language: locale.languageCode.toLowerCase(),
        isSelected: locale.languageCode.toLowerCase() == selectedLocale,
      ),
    const _SelectCurrencyPaddingItem(height: JDimens.spacing_xxxl),
  ];
}

sealed class _SelectLanguageDrawerItem {
  const _SelectLanguageDrawerItem();

  Widget build(BuildContext context);
}

final class _SelectCurrencyPaddingItem extends _SelectLanguageDrawerItem {
  final double height;

  const _SelectCurrencyPaddingItem({required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

final class _SelectLanguageCardItem extends _SelectLanguageDrawerItem {
  final String language;
  final bool isSelected;

  const _SelectLanguageCardItem({
    required this.language,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: JDimens.spacing_s),
      child: SelectLanguageCard(
        language: language,
        isSelected: isSelected,
        onSelected: () {
          if (!isSelected) {
            context.read<SettingsBloc>().add(SettingsEventUpdateLanguage(language));
          }

          Navigator.of(context).pop();
        },
      ),
    );
  }
}

final class SelectLanguageCard extends StatelessWidget {
  final String language;
  final bool isSelected;
  final VoidCallback onSelected;

  const SelectLanguageCard({
    required this.language,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return JCard(
      onPressed: onSelected,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(JDimens.spacing_s),
            child: Text(
              context.strings().settings_languageLabel(language),
              style: context.textTheme().titleLarge,
            ),
          ),
          const Spacer(),
          if (isSelected)
            Padding(
              padding: const EdgeInsets.only(right: JDimens.spacing_m),
              child: Icon(JamIcons.check, size: JDimens.size_24, color: context.colorScheme().tertiary),
            ),
        ],
      ),
    );
  }
}
