import "package:aroma_mobile/domain/entity/difficulty_entity.dart";
import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_state.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/widget/common/aroma_tag.dart";
import "package:aroma_mobile/presentation/widget/common/star_rating.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_filter.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

const filterDrawerHeightRatio = 0.8;
const _maxTime = 120.0;
const _maxServings = 20.0;
const _loading = "Loading";
const _empty = "Empty";

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FilterDrawerBloc()..add(FilterDrawerTagQueryChanged(tagQuery: ""))),
        BlocProvider.value(value: widget.bloc),
      ],
      child: Padding(
        padding: const EdgeInsets.only(
          left: JDimens.spacing_m,
          right: JDimens.spacing_m,
          bottom: JDimens.spacing_m,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FilterItems(
                sort: sort,
                filter: filter,
                onSortChanged: (value) => setState(() => sort = value),
                onFilterChanged: (value) => setState(() => filter = value),
              ),
            ),
            Divider(height: 1, color: context.colorScheme().onSurface),
            SizedBox(height: JDimens.spacing_s),
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
      child: Padding(
        padding: const EdgeInsets.only(
          top: JDimens.spacing_m,
          bottom: JDimens.spacing_s,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: JDimens.spacing_xs,
          children: [
            _FilterSection(
              title: strings.recipes_drawer_sortTitle,
              textTheme: textTheme,
              child: _SortRow(
                sort: sort,
                onSortChanged: onSortChanged,
              ),
            ),
            _FilterSection(
              title: strings.recipes_drawer_ratingTitle,
              textTheme: textTheme,
              child: _RatingRow(
                rating: filter.ratingMin,
                onRatingChanged: (value) => onFilterChanged(filter.copyWith(ratingMin: value)),
              ),
            ),
            _FilterSection(
              title: strings.recipes_drawer_timeTitle,
              textTheme: textTheme,
              child: _TimeRow(
                timeMin: filter.timeMin,
                timeMax: filter.timeMax,
                onTimeChanged: (min, max) => onFilterChanged(filter.copyWith(timeMin: min, timeMax: max)),
              ),
            ),
            _FilterSection(
              title: strings.recipes_drawer_servingsTitle,
              textTheme: textTheme,
              child: _ServingsRow(
                servingsMin: filter.servingsMin,
                servingsMax: filter.servingsMax,
                onServingsChanged: (min, max) => onFilterChanged(filter.copyWith(servingsMin: min, servingsMax: max)),
              ),
            ),
            _FilterSection(
              title: strings.recipes_drawer_difficultyTitle,
              textTheme: textTheme,
              child: _DifficultyRow(
                difficulties: filter.difficulties,
                onDifficultyChanged: (difficulties) => onFilterChanged(filter.copyWith(difficulties: difficulties)),
              ),
            ),
            _FilterSection(
              title: strings.recipes_drawer_tagsTitle,
              textTheme: textTheme,
              child: _TagsRow(
                tags: filter.tags,
                onTagsChanged: (tags) => onFilterChanged(filter.copyWith(tags: tags)),
              ),
            ),
          ],
        ),
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

class _RatingRow extends StatelessWidget {
  final int? rating;
  final Function(int?) onRatingChanged;

  const _RatingRow({
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: JDimens.spacing_xxs,
        left: JDimens.spacing_s,
        bottom: JDimens.spacing_xxs,
      ),
      child: StarRating(
        rating: rating ?? 0,
        onRatingChanged: (value) => onRatingChanged(value == 0 ? null : value),
        size: JDimens.size_32,
      ),
    );
  }
}

class _TimeRow extends StatelessWidget {
  final int? timeMin;
  final int? timeMax;
  final Function(int?, int?) onTimeChanged;

  const _TimeRow({
    required this.timeMin,
    required this.timeMax,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: RangeValues(timeMin?.toDouble() ?? 0, timeMax?.toDouble() ?? _maxTime),
      labels: RangeLabels(timeMin?.toString() ?? "0", timeMax?.toString() ?? "∞"),
      divisions: (_maxTime / 5).toInt(),
      max: _maxTime,
      onChanged: (values) {
        final min = values.start.floor();
        final max = values.end.floor();

        onTimeChanged(min == 0 ? null : min, max == _maxTime ? null : max);
      },
    );
  }
}

class _ServingsRow extends StatelessWidget {
  final int? servingsMin;
  final int? servingsMax;
  final Function(int?, int?) onServingsChanged;

  const _ServingsRow({
    required this.servingsMin,
    required this.servingsMax,
    required this.onServingsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: RangeValues(servingsMin?.toDouble() ?? 0, servingsMax?.toDouble() ?? _maxServings),
      labels: RangeLabels(servingsMin?.toString() ?? "0", servingsMax?.toString() ?? "∞"),
      divisions: _maxServings.toInt(),
      max: _maxServings,
      onChanged: (values) {
        final min = values.start.floor();
        final max = values.end.floor();

        onServingsChanged(min == 0 ? null : min, max == _maxServings ? null : max);
      },
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

class _TagsRow extends StatelessWidget {
  final Set<TagEntity> tags;
  final Function(Set<TagEntity>) onTagsChanged;

  const _TagsRow({required this.tags, required this.onTagsChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: JDimens.spacing_xs),
      child: Wrap(
        spacing: JDimens.spacing_xs,
        runSpacing: JDimens.spacing_xs,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _TagDropdown(tags: tags, onTagsChanged: onTagsChanged),
          ...tags.map(
            (value) => AromaTag(
              text: value.name,
              onPressed: () => onTagsChanged(tags.difference({value})),
              showClose: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _TagDropdown extends StatefulWidget {
  final Set<TagEntity> tags;
  final Function(Set<TagEntity>) onTagsChanged;

  const _TagDropdown({required this.tags, required this.onTagsChanged});

  @override
  State<_TagDropdown> createState() => _TagDropdownState();
}

class _TagDropdownState extends State<_TagDropdown> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () => context.read<FilterDrawerBloc>().add(
        FilterDrawerTagQueryChanged(tagQuery: _controller.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();
    final textTheme = context.textTheme();
    final colorScheme = context.colorScheme();

    return BlocBuilder<FilterDrawerBloc, FilterDrawerState>(
      builder: (context, state) {
        final border = OutlineInputBorder(
          borderRadius: BorderRadius.circular(JDimens.radius_m),
          borderSide: BorderSide(color: colorScheme.onSurface, width: 2),
        );

        return DropdownMenu<TagEntity>(
          controller: _controller,
          hintText: strings.recipes_drawer_tagsHint,
          enableSearch: false,
          requestFocusOnTap: true,
          textStyle: textTheme.bodyMedium,
          trailingIcon: const Icon(Icons.search),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.5)),
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(
              JDimens.spacing_s,
              JDimens.spacing_xxs,
              JDimens.spacing_xxs,
              JDimens.spacing_xxs,
            ),
            border: border,
            focusedBorder: border,
            errorBorder: border,
            focusedErrorBorder: border,
            disabledBorder: border,
            enabledBorder: border,
            constraints: BoxConstraints(maxHeight: JDimens.size_40),
          ),
          onSelected: (value) {
            if (value != null) {
              widget.onTagsChanged(widget.tags.union({value}));
            }

            _controller.clear();
            FocusScope.of(context).unfocus();
          },
          dropdownMenuEntries: switch (state.tagStatus) {
            TagStatus.loading => [
              DropdownMenuEntry(
                value: TagEntity(id: -1, name: _loading),
                label: _loading,
                labelWidget: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: JDimens.spacing_xxs),
                    child: JLoadingIndicator(),
                  ),
                ),
                enabled: false,
              ),
            ],
            TagStatus.empty => [
              DropdownMenuEntry(
                value: TagEntity(id: -1, name: _empty),
                label: strings.recipes_drawer_tagsEmpty,
                enabled: false,
              ),
            ],
            TagStatus.success =>
              state.tagResults
                  .map(
                    (value) => DropdownMenuEntry(
                      value: value,
                      label: value.name,
                      labelWidget: Align(
                        alignment: Alignment.centerLeft,
                        child: AromaTag(text: value.name),
                      ),
                    ),
                  )
                  .toList(),
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
