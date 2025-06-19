// ignore: prefer_double_quotes
import 'package:flutter/material.dart';
import "package:j1_core_base/j1_core_base.dart";

typedef RatingChangeCallback = void Function(int rating);

const _starCount = 5;

class StarRating extends StatelessWidget {
  final int rating;
  final RatingChangeCallback? onRatingChanged;
  final double size;

  const StarRating({
    this.rating = 0,
    this.onRatingChanged,
    this.size = JDimens.size_20,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _starCount,
        (index) => _Star(
          index: index,
          rating: rating,
          size: size,
          onRatingChanged: onRatingChanged,
        ),
      ),
    );
  }
}

class _Star extends StatelessWidget {
  final int index;
  final int rating;
  final double size;
  final RatingChangeCallback? onRatingChanged;

  const _Star({
    required this.index,
    required this.rating,
    required this.size,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    final iconData = switch (index) {
      _ when index * 2 >= rating => JamIcons.star,
      _ when index * 2 > rating - 2 && index * 2 < rating => JamIcons.star_half,
      _ => JamIcons.star_full,
    };

    return InkResponse(
      highlightColor: Colors.transparent,
      onTap: onRatingChanged == null ? null : () => onRatingChanged!(index * 2 + 2),
      onLongPress: onRatingChanged == null ? null : () => onRatingChanged!(index * 2 + 1),
      child: Icon(iconData, color: context.colorScheme().tertiary, size: size),
    );
  }
}
