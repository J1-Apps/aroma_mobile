import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/widget/common/aroma_back_button.dart";
import "package:aroma_mobile/presentation/widget/common/aroma_settings_button.dart";
import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class CreateRecipeScreen extends StatelessWidget {
  const CreateRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return ScaffoldMessenger(
      child: Scaffold(
        appBar: JAppBar(
          title: strings.app_title,
          titleStyle: context.textTheme().headlineLarge,
          trailingActions: [const AromaSettingsButton()],
          leadingAction: context.canPop() ? const AromaBackButton() : null,
        ),
        body: const Center(child: Text("Create")),
      ),
    );
  }
}
