import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/widget/common/aroma_settings_button.dart";
import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class RecipesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return JAppBar(
      title: strings.app_title,
      titleStyle: context.textTheme().headlineLarge,
      trailingActions: [const AromaSettingsButton()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(JAppBarDimens.medium.height);
}
