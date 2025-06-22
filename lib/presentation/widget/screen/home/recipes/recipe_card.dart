import "package:aroma_mobile/presentation/details/recipe_card_details.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/util/string_extension.dart";
import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

const double _selectedBrightness = 0.2;
const double _imageOpacity = 0.15;
const double _titleFontSize = 18;
const FontWeight _fontWeight = FontWeight.w600;

class RecipeCard extends StatelessWidget {
  final RecipeCardDetails recipe;
  final bool isSelected;
  final VoidCallback onPressed;
  final VoidCallback? onLongPressed;

  const RecipeCard({
    required this.recipe,
    required this.isSelected,
    required this.onPressed,
    required this.onLongPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();
    final colors = theme.colorScheme;
    final highlighted = colors.surface.brighten(
      theme.brightness == Brightness.dark ? _selectedBrightness : -_selectedBrightness,
    );

    return JCard(
      key: ValueKey(recipe.id),
      size: JWidgetSize.large,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      overrides: JCardOverrides(
        foregroundColor: isSelected ? colors.tertiary : colors.onSurface,
        backgroundColor: isSelected ? highlighted : colors.surface,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (recipe.imageUrl.isNotBlank) _RecipeCardImage(imageUrl: recipe.imageUrl),
          _RecipeCardTitle(title: recipe.title),
          _RecipeCardInfo(time: recipe.totalTime, servings: recipe.servings),
        ],
      ),
    );
  }
}

class _RecipeCardImage extends StatelessWidget {
  final String imageUrl;

  const _RecipeCardImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.maybeSizeOf(context);
    final imageSize = (screenSize?.width ?? 360).toInt();

    return JNetworkImage(
      source: imageUrl,
      fit: BoxFit.cover,
      imageHeight: imageSize,
      opacity: _imageOpacity,
    );
  }
}

class _RecipeCardTitle extends StatelessWidget {
  final String title;

  const _RecipeCardTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(JDimens.spacing_m),
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: context.textTheme().titleMedium?.copyWith(
          fontSize: _titleFontSize,
          fontWeight: _fontWeight,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      ),
    );
  }
}

class _RecipeCardInfo extends StatelessWidget {
  final int time;
  final int servings;

  const _RecipeCardInfo({
    required this.time,
    required this.servings,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme().labelLarge?.copyWith(
      fontWeight: _fontWeight,
    );

    return Container(
      padding: const EdgeInsets.all(JDimens.spacing_m),
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Icon(JamIcons.clock, size: JDimens.size_20),
          const SizedBox(width: JDimens.spacing_xxs),
          Text(_formatTime(context, time), style: style),
          const Spacer(),
          Text(servings.toString(), style: style),
          const SizedBox(width: JDimens.spacing_xxxs),
          Icon(JamIcons.user, size: JDimens.size_20),
        ],
      ),
    );
  }
}

String _formatTime(BuildContext context, int time) {
  final hours = time ~/ 60;
  final minutes = time % 60;

  final hourString = hours > 0 ? "$hours${context.strings().recipe_card_hour}" : "";
  final minuteString = minutes > 0 ? "$minutes${context.strings().recipe_card_minute}" : "";
  final spacer = hours > 0 && minutes > 0 ? " " : "";

  return "$hourString$spacer$minuteString";
}
