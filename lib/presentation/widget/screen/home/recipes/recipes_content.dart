import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class RecipesContent extends StatelessWidget {
  const RecipesContent({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the recipes content.
    return BlocSelector<RecipesBloc, RecipesState, String>(
      selector: (state) => state.searchQuery.isEmpty ? "Empty" : state.searchQuery,
      builder: (_, searchQuery) => GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: JDimens.spacing_xs,
        crossAxisSpacing: JDimens.spacing_xs,
        padding: const EdgeInsets.fromLTRB(
          JDimens.spacing_m,
          JDimens.spacing_xs,
          JDimens.spacing_m,
          JDimens.spacing_xxxl,
        ),
        children: List.generate(
          20,
          (_) => DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme().primary,
              borderRadius: BorderRadius.circular(JDimens.radius_m),
            ),
            child: Center(
              child: Text("search: $searchQuery"),
            ),
          ),
        ),
      ),
    );
  }
}
