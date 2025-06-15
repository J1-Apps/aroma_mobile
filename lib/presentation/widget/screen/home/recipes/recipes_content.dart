import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class RecipesContent extends StatelessWidget {
  const RecipesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return JLoadingProvider(
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: JDimens.spacing_xs,
        crossAxisSpacing: JDimens.spacing_xs,
        children: List.generate(
          20,
          (_) => const JLoadingBox(
            cornerRadius: JDimens.radius_m,
          ),
        ),
      ),
    );
  }
}
