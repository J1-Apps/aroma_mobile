import "package:aroma_mobile/domain/entity/difficulty_entity.dart";
import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/util/localization/app_localizations.dart";
import "package:aroma_mobile/presentation/widget/common/aroma_tag.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/filter_drawer.dart";
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
            ..._createFilterTags(context.strings(), filter.$2),
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
      onPressed: () => context.showJBottomSheet(
        child: FilterDrawer(bloc: context.read<RecipesBloc>()),
        scrollControlDisabledMaxHeightRatio: filterDrawerHeightRatio,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          JDimens.spacing_s,
          JDimens.spacing_xs,
          JDimens.spacing_xs,
          JDimens.spacing_xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: JDimens.spacing_xxs,
          children: [
            Text(
              context.strings().recipes_sortFilterHint,
              style: context.textTheme().labelMedium,
            ),
            const Icon(JamIcons.chevron_down, size: JDimens.size_16),
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

    return AromaTag(text: sortToString(strings, sort));
  }
}

List<Widget> _createFilterTags(Strings strings, FilterEntity filter) {
  final timeEqual = filter.timeMin == filter.timeMax;
  final servingsEqual = filter.servingsMin == filter.servingsMax;

  return [
    if (timeEqual && filter.timeMin != null) AromaTag(text: strings.recipes_filter_timeEqual(filter.timeMin!)),
    if (filter.timeMin != null && !timeEqual) AromaTag(text: strings.recipes_filter_timeMin(filter.timeMin!)),
    if (filter.timeMax != null && !timeEqual) AromaTag(text: strings.recipes_filter_timeMax(filter.timeMax!)),
    if (filter.ratingMin != null) AromaTag(text: strings.recipes_filter_ratingMin(filter.ratingMin!.toDouble() / 2.0)),
    if (servingsEqual && filter.servingsMin != null)
      AromaTag(text: strings.recipes_filter_servingsEqual(filter.servingsMin!)),
    if (filter.servingsMin != null && !servingsEqual)
      AromaTag(text: strings.recipes_filter_servingsMin(filter.servingsMin!)),
    if (filter.servingsMax != null && !servingsEqual)
      AromaTag(text: strings.recipes_filter_servingsMax(filter.servingsMax!)),
    ...filter.difficulties.map((difficulty) => AromaTag(text: difficultyToString(strings, difficulty))),
    ...filter.tags.map((tag) => AromaTag(text: tag.name)),
  ];
}

String sortToString(Strings strings, SortEntity sort) {
  return switch (sort) {
    SortEntity.none => strings.recipes_sort_none,
    SortEntity.recentlyViewed => strings.recipes_sort_recentlyViewed,
    SortEntity.rating => strings.recipes_sort_rating,
    SortEntity.quickest => strings.recipes_sort_quickest,
    SortEntity.easiest => strings.recipes_sort_easiest,
    SortEntity.alphabetical => strings.recipes_sort_alphabetical,
  };
}

String difficultyToString(Strings strings, DifficultyEntity difficulty) {
  return switch (difficulty) {
    DifficultyEntity.easy => strings.recipes_filter_difficultyEasy,
    DifficultyEntity.medium => strings.recipes_filter_difficultyMedium,
    DifficultyEntity.hard => strings.recipes_filter_difficultyHard,
  };
}
