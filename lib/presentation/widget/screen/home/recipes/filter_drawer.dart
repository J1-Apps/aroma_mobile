import "package:aroma_mobile/domain/entity/difficulty_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_state.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
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

class FilterDrawer extends StatelessWidget {
  final RecipesBloc bloc;

  const FilterDrawer({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FilterDrawerBloc()..add(FilterDrawerEventTagQueryChanged(tagQuery: ""))),
        BlocProvider.value(value: bloc),
      ],
      child: Padding(
        padding: const EdgeInsets.only(
          left: JDimens.spacing_m,
          right: JDimens.spacing_m,
          bottom: JDimens.spacing_m,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(child: _FilterItems()),
            Divider(height: 1, color: context.colorScheme().onSurface),
            const SizedBox(height: JDimens.spacing_s),
            const _ResetRow(),
          ],
        ),
      ),
    );
  }
}

class _FilterItems extends StatelessWidget {
  const _FilterItems();

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
              child: const _SortRow(),
            ),
            _FilterSection(
              title: strings.recipes_drawer_ratingTitle,
              textTheme: textTheme,
              child: const _RatingRow(),
            ),
            _FilterSection(
              title: strings.recipes_drawer_timeTitle,
              textTheme: textTheme,
              child: const _TimeRow(),
            ),
            _FilterSection(
              title: strings.recipes_drawer_servingsTitle,
              textTheme: textTheme,
              child: const _ServingsRow(),
            ),
            _FilterSection(
              title: strings.recipes_drawer_difficultyTitle,
              textTheme: textTheme,
              child: const _DifficultyRow(),
            ),
            _FilterSection(
              title: strings.recipes_drawer_tagsTitle,
              textTheme: textTheme,
              child: const _TagsRow(),
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
  const _SortRow();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipesBloc, RecipesState, SortEntity>(
      selector: (state) => state.sort,
      builder: (context, sort) => Wrap(
        spacing: JDimens.spacing_xs,
        children: _sortOptions
            .map(
              (value) => _FilterChip(
                text: sortToString(context.strings(), value),
                selected: sort == value,
                onSelected: (_) => context.read<RecipesBloc>().add(
                  RecipesEventUpdateSort(sort: sort == value ? SortEntity.none : value),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _RatingRow extends StatelessWidget {
  const _RatingRow();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipesBloc, RecipesState, int?>(
      selector: (state) => state.filter.ratingMin,
      builder: (context, ratingMin) => Padding(
        padding: const EdgeInsets.only(
          top: JDimens.spacing_xxs,
          left: JDimens.spacing_s,
          bottom: JDimens.spacing_xxs,
        ),
        child: StarRating(
          rating: ratingMin ?? 0,
          onRatingChanged: (value) => context.read<RecipesBloc>().add(
            RecipesEventUpdateRatingMin(ratingMin: value == 0 ? null : value),
          ),
          size: JDimens.size_32,
        ),
      ),
    );
  }
}

class _TimeRow extends StatelessWidget {
  const _TimeRow();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipesBloc, RecipesState, (int?, int?)>(
      selector: (state) => (state.filter.timeMin, state.filter.timeMax),
      builder: (context, values) => RangeSlider(
        values: RangeValues(values.$1?.toDouble() ?? 0, values.$2?.toDouble() ?? _maxTime),
        labels: RangeLabels(values.$1?.toString() ?? "0", values.$2?.toString() ?? "∞"),
        divisions: (_maxTime / 5).toInt(),
        max: _maxTime,
        onChanged: (values) {
          final min = values.start.floor();
          final max = values.end.floor();

          context.read<RecipesBloc>().add(
            RecipesEventUpdateTime(
              timeMin: min == 0 ? null : min,
              timeMax: max == _maxTime ? null : max,
            ),
          );
        },
      ),
    );
  }
}

class _ServingsRow extends StatelessWidget {
  const _ServingsRow();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipesBloc, RecipesState, (int?, int?)>(
      selector: (state) => (state.filter.servingsMin, state.filter.servingsMax),
      builder: (context, values) => RangeSlider(
        values: RangeValues(values.$1?.toDouble() ?? 0, values.$2?.toDouble() ?? _maxServings),
        labels: RangeLabels(values.$1?.toString() ?? "0", values.$2?.toString() ?? "∞"),
        divisions: _maxServings.toInt(),
        max: _maxServings,
        onChanged: (values) {
          final min = values.start.floor();
          final max = values.end.floor();

          context.read<RecipesBloc>().add(
            RecipesEventUpdateServings(
              servingsMin: min == 0 ? null : min,
              servingsMax: max == _maxServings ? null : max,
            ),
          );
        },
      ),
    );
  }
}

class _DifficultyRow extends StatelessWidget {
  const _DifficultyRow();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipesBloc, RecipesState, Set<DifficultyEntity>>(
      selector: (state) => state.filter.difficulties,
      builder: (context, difficulties) => Wrap(
        spacing: JDimens.spacing_xs,
        children: DifficultyEntity.values.map(
          (value) {
            final isSelected = difficulties.contains(value);

            return _FilterChip(
              text: difficultyToString(context.strings(), value),
              selected: isSelected,
              onSelected: (_) => context.read<RecipesBloc>().add(
                RecipesEventUpdateDifficulty(
                  difficulties: isSelected ? difficulties.difference({value}) : difficulties.union({value}),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class _TagsRow extends StatelessWidget {
  const _TagsRow();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipesBloc, RecipesState, Set<TagEntity>>(
      selector: (state) => state.filter.tags,
      builder: (context, tags) => Padding(
        padding: const EdgeInsets.only(top: JDimens.spacing_xs),
        child: Wrap(
          spacing: JDimens.spacing_xs,
          runSpacing: JDimens.spacing_xs,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _TagDropdown(
              tags: tags,
              onTagsChanged: (tags) => context.read<RecipesBloc>().add(
                RecipesEventUpdateTags(tags: tags),
              ),
            ),
            ...tags.map(
              (value) => AromaTag(
                text: value.name,
                onPressed: () => context.read<RecipesBloc>().add(
                  RecipesEventUpdateTags(tags: tags.difference({value})),
                ),
                showClose: true,
              ),
            ),
          ],
        ),
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
  var previousQuery = "";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final query = _controller.text;

      if (query != previousQuery) {
        previousQuery = query;
        context.read<FilterDrawerBloc>().add(
          FilterDrawerEventTagQueryChanged(tagQuery: query),
        );
      }
    });
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

class _ResetRow extends StatelessWidget {
  const _ResetRow();

  @override
  Widget build(BuildContext context) {
    return JTextButton(
      text: context.strings().recipes_filter_reset,
      forceCaps: false,
      type: JButtonType.flat,
      color: JWidgetColor.onSurface,
      size: JWidgetSize.small,
      overrides: JTextButtonOverrides(outlineColor: context.colorScheme().onSurface),
      onPressed: () => context.read<RecipesBloc>().add(const RecipesEventResetFilter()),
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
