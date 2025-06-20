import "package:dart_mappable/dart_mappable.dart";

part "difficulty_entity.mapper.dart";

@MappableEnum()
enum DifficultyEntity {
  easy,
  medium,
  hard;

  factory DifficultyEntity.fromModel(int model) {
    return switch (model) {
      1 => DifficultyEntity.easy,
      2 => DifficultyEntity.medium,
      3 => DifficultyEntity.hard,
      _ => DifficultyEntity.medium,
    };
  }

  int toModel() {
    switch (this) {
      case DifficultyEntity.easy:
        return 1;
      case DifficultyEntity.medium:
        return 2;
      case DifficultyEntity.hard:
        return 3;
    }
  }
}
