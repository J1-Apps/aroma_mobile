import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/widget/common/aroma_settings_button.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_content.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_filter.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_placeholder.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_search.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

const _listRestorationId = "recipes_list";

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return Scaffold(
      appBar: JAppBar(
        title: strings.app_title,
        titleStyle: context.textTheme().headlineLarge,
        trailingActions: [const AromaSettingsButton()],
      ),
      body: const _RecipesList(),
    );
  }
}

class _RecipesList extends StatelessWidget {
  const _RecipesList();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipesBloc, RecipesState, RecipesStatus>(
      selector: (state) => state.status,
      builder: (_, status) => NestedScrollView(
        restorationId: _listRestorationId,
        floatHeaderSlivers: true,
        physics: status == RecipesStatus.loading ? const NeverScrollableScrollPhysics() : null,
        headerSliverBuilder: (_, _) => [
          const SliverFloatingHeader(child: _RecipesHeader()),
        ],
        body: _RecipesContentSelector(status: status),
      ),
    );
  }
}

class _RecipesHeader extends StatelessWidget {
  const _RecipesHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme().surface,
      padding: const EdgeInsets.symmetric(
        horizontal: JDimens.spacing_m,
        vertical: JDimens.spacing_xs,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const RecipesSearch(),
          const RecipesFilter(),
        ],
      ),
    );
  }
}

class _RecipesContentSelector extends StatelessWidget {
  final RecipesStatus status;

  const _RecipesContentSelector({required this.status});

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      RecipesStatus.loading => const RecipesPlaceholder(),
      RecipesStatus.empty => const RecipesPlaceholder(),
      RecipesStatus.error => const RecipesPlaceholder(),
      RecipesStatus.success => const RecipesContent(),
    };
  }
}
