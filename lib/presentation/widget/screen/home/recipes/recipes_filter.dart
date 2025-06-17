import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/widget/common/aroma_tag.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class RecipesFilter extends StatelessWidget {
  const RecipesFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipesBloc, RecipesState, (SortEntity, FilterEntity)>(
      selector: (state) => (state.sort, state.filter),
      builder: (context, filter) {
        return Wrap(
          spacing: JDimens.spacing_xs,
          runSpacing: JDimens.spacing_xs,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _RecipesFilterDropdown(),
            if (filter.$1 != SortEntity.none) _RecipesSortTag(sort: filter.$1),
          ],
        );
      },
    );
  }
}

class _RecipesFilterDropdown extends StatelessWidget {
  const _RecipesFilterDropdown();

  @override
  Widget build(BuildContext context) {
    return JCard(
      size: JWidgetSize.small,
      // TODO: Show filter bottom sheet.
      onPressed: () => context.showJToastWithText(text: "Sort and filter", hasClose: true),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          JDimens.spacing_s,
          JDimens.spacing_xs,
          JDimens.spacing_xs,
          JDimens.spacing_xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.strings().recipes_sortFilterHint,
              style: context.textTheme().labelMedium,
            ),
            const SizedBox(width: JDimens.spacing_xxs),
            const Icon(JamIcons.chevrondown, size: JDimens.size_16),
          ],
        ),
      ),
    );
  }
}

class _RecipesSortTag extends StatelessWidget {
  final SortEntity sort;

  const _RecipesSortTag({required this.sort});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return AromaTag(
      text: switch (sort) {
        SortEntity.none => strings.recipes_sort_recentlyViewed,
        SortEntity.recentlyViewed => strings.recipes_sort_recentlyViewed,
        SortEntity.rating => strings.recipes_sort_rating,
        SortEntity.quickest => strings.recipes_sort_quickest,
        SortEntity.easiest => strings.recipes_sort_easiest,
      },
      onPressed: () => context.read<RecipesBloc>().add(const RecipesEventSort(sort: SortEntity.none)),
    );
  }
}
