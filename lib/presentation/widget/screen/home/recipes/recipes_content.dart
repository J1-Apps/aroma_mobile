import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/details/recipe_card_details.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipe_card.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class RecipesContent extends StatelessWidget {
  const RecipesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipesBloc, RecipesState, (List<RecipeCardDetails>, Set<String>)>(
      selector: (state) => (state.recipes, state.selectedIds),
      builder: (_, state) {
        final isSelecting = state.$2.isNotEmpty;

        return GridView.builder(
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
          itemCount: state.$1.length,
          itemBuilder: (_, index) {
            final recipe = state.$1[index];
            void navigateItem() => context.navigate(AromaRoute.view, RecipeRouteConfig(recipeId: recipe.id));
            void selectItem() => context.read<RecipesBloc>().add(RecipesEventToggleSelected(recipeId: recipe.id));

            return RecipeCard(
              recipe: recipe,
              isSelected: state.$2.contains(recipe.id),
              onPressed: isSelecting ? selectItem : navigateItem,
              onLongPressed: isSelecting ? null : selectItem,
            );
          },
        );
      },
    );
  }
}
