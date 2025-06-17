import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

const filterDrawerHeightRatio = 0.6;

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
    final textTheme = context.textTheme();

    return BlocProvider.value(
      value: widget.bloc,
      child: Padding(
        padding: const EdgeInsets.all(JDimens.spacing_m),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sort by", style: textTheme.titleMedium),
            const SizedBox(height: JDimens.spacing_s),
            FilterChip(label: Text("test"), onSelected: (_) {}),
            const SizedBox(height: JDimens.spacing_s),
            Text("Rating", style: textTheme.titleMedium),
            const SizedBox(height: JDimens.spacing_s),
            Text("Time", style: textTheme.titleMedium),
            const SizedBox(height: JDimens.spacing_s),
            Text("Servings", style: textTheme.titleMedium),
            const SizedBox(height: JDimens.spacing_s),
            Text("Difficulty", style: textTheme.titleMedium),
            const SizedBox(height: JDimens.spacing_s),
            Text("Tags", style: textTheme.titleMedium),
            const SizedBox(height: JDimens.spacing_s),
            _ActionRow(sort: sort, filter: filter),
          ],
        ),
      ),
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
        const SizedBox(width: JDimens.spacing_s),
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
