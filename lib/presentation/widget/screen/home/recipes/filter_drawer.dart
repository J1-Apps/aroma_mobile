import "package:aroma_mobile/domain/entity/difficulty_entity.dart";
import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_filter.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

const filterDrawerHeightRatio = 0.8;

class FilterDrawer extends StatefulWidget {
  final RecipesBloc bloc;

  const FilterDrawer({
    required this.bloc,
    super.key,
  });

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  late SortEntity sort;
  late FilterEntity filter;

  @override
  void initState() {
    sort = widget.bloc.state.sort;
    filter = widget.bloc.state.filter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: Padding(
        padding: const EdgeInsets.all(JDimens.spacing_s),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: JDimens.spacing_s,
          children: [
            _FilterItems(
              sort: sort,
              filter: filter,
              onSortChanged: (value) => setState(() => sort = value),
              onFilterChanged: (value) => setState(() => filter = value),
            ),
            Divider(height: 1, color: context.colorScheme().onSurface),
            _ActionRow(sort: sort, filter: filter),
          ],
        ),
      ),
    );
  }
}

class _FilterItems extends StatelessWidget {
  final SortEntity sort;
  final FilterEntity filter;
  final Function(SortEntity) onSortChanged;
  final Function(FilterEntity) onFilterChanged;

  const _FilterItems({
    required this.sort,
    required this.filter,
    required this.onSortChanged,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();
    final textTheme = context.textTheme();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: JDimens.spacing_s,
        children: [
          _FilterSection(
            title: strings.recipes_drawer_sortTitle,
            textTheme: textTheme,
            child: _SortRow(
              sort: sort,
              onSortChanged: onSortChanged,
            ),
          ),
          Text(strings.recipes_drawer_ratingTitle, style: textTheme.titleMedium),
          Text(strings.recipes_drawer_timeTitle, style: textTheme.titleMedium),
          Text(strings.recipes_drawer_servingsTitle, style: textTheme.titleMedium),
          _FilterSection(
            title: strings.recipes_drawer_difficultyTitle,
            textTheme: textTheme,
            child: _DifficultyRow(
              difficulties: filter.difficulties,
              onDifficultyChanged: (difficulties) => onFilterChanged(filter.copyWith(difficulties: difficulties)),
            ),
          ),
          Text(strings.recipes_drawer_tagsTitle, style: textTheme.titleMedium),
        ],
      ),
    );
  }
}

class _FilterSection extends StatelessWidget {
  final String title;
  final TextTheme textTheme;
  final Widget child;

  const _FilterSection({
    required this.title,
    required this.textTheme,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: JDimens.spacing_xxxs,
      children: [
        Text(title, style: textTheme.titleMedium),
        child,
      ],
    );
  }
}

const _sortOptions = [
  SortEntity.recentlyViewed,
  SortEntity.rating,
  SortEntity.quickest,
  SortEntity.easiest,
  SortEntity.alphabetical,
];

class _SortRow extends StatelessWidget {
  final SortEntity sort;
  final Function(SortEntity) onSortChanged;

  const _SortRow({required this.sort, required this.onSortChanged});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: JDimens.spacing_xs,
      children: _sortOptions
          .map(
            (value) => _FilterChip(
              text: sortToString(context.strings(), value),
              selected: sort == value,
              onSelected: (_) => onSortChanged(sort == value ? SortEntity.none : value),
            ),
          )
          .toList(),
    );
  }
}

class _DifficultyRow extends StatelessWidget {
  final Set<DifficultyEntity> difficulties;
  final Function(Set<DifficultyEntity>) onDifficultyChanged;

  const _DifficultyRow({
    required this.difficulties,
    required this.onDifficultyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: JDimens.spacing_xs,
      children: DifficultyEntity.values.map(
        (value) {
          final isSelected = difficulties.contains(value);

          return _FilterChip(
            text: difficultyToString(context.strings(), value),
            selected: isSelected,
            onSelected: (_) => onDifficultyChanged(
              isSelected ? difficulties.difference({value}) : difficulties.union({value}),
            ),
          );
        },
      ).toList(),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final SortEntity sort;
  final FilterEntity filter;

  const _ActionRow({
    required this.sort,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return Row(
      spacing: JDimens.spacing_s,
      children: [
        Expanded(
          child: JTextButton(
            text: strings.recipes_filter_reset,
            forceCaps: false,
            type: JButtonType.flat,
            color: JWidgetColor.onSurface,
            size: JWidgetSize.small,
            overrides: JTextButtonOverrides(outlineColor: context.colorScheme().onSurface),
            onPressed: () {
              context.read<RecipesBloc>().add(RecipesEventFilter(sort: SortEntity.none, filter: FilterEntity()));
              context.pop();
            },
          ),
        ),
        Expanded(
          child: JTextButton(
            text: strings.recipes_filter_apply,
            forceCaps: false,
            size: JWidgetSize.small,
            onPressed: () {
              context.read<RecipesBloc>().add(RecipesEventFilter(sort: sort, filter: filter));
              context.pop();
            },
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String text;
  final bool selected;
  final Function(bool) onSelected;

  const _FilterChip({
    required this.text,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text),
      onSelected: onSelected,
      selected: selected,
      labelPadding: EdgeInsets.symmetric(horizontal: JDimens.spacing_xxs),
      padding: EdgeInsets.all(JDimens.spacing_xxs),
      labelStyle: context.textTheme().bodyMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(JDimens.radius_m),
        side: BorderSide(color: context.colorScheme().onSurface, width: 2),
      ),
      showCheckmark: false,
    );
  }
}
