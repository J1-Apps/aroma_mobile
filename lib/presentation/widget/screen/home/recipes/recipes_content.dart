import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/details/recipe_card_details.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipe_card.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class RecipesContent extends StatelessWidget {
  const RecipesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipesBloc, RecipesState, List<RecipeCardDetails>>(
      selector: (state) => state.recipes,
      builder: (_, recipes) => GridView.builder(
        padding: const EdgeInsets.fromLTRB(
          JDimens.spacing_m,
          JDimens.spacing_xs,
          JDimens.spacing_m,
          JDimens.spacing_xxxl,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: JDimens.spacing_xs,
          crossAxisSpacing: JDimens.spacing_xs,
        ),
        itemCount: recipes.length,
        // TODO: Implement selected, onPressed, onLongPressed.
        itemBuilder: (_, index) => RecipeCard(
          recipe: recipes[index],
          isSelected: false,
          onPressed: () {},
          onLongPressed: () {},
        ),
      ),
    );
  }
}
