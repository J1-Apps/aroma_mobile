import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class RecipesSearch extends StatefulWidget {
  const RecipesSearch({super.key});

  @override
  State<RecipesSearch> createState() => _RecipesSearchState();
}

class _RecipesSearchState extends State<RecipesSearch> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return JTextField(
      controller: _searchController,
      hint: context.strings().recipes_searchHint,
      icon: JamIcons.search,
      autocorrect: false,
      onSubmitted: (value) => context.read<RecipesBloc>().add(RecipesEventSearch(searchQuery: value)),
      onIconPressed: () {
        FocusScope.of(context).unfocus();
        context.read<RecipesBloc>().add(RecipesEventSearch(searchQuery: _searchController.text));
      },
      overrides: JTextFieldOverrides(
        iconColor: context.colorScheme().tertiary,
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
