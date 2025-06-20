import "package:dart_mappable/dart_mappable.dart";

part "difficulty_entity.mapper.dart";

@MappableEnum()
enum DifficultyEntity {
  easy,
  medium,
  hard;

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
