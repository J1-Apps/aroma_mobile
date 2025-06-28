import "package:aroma_mobile/domain/entity/difficulty_entity.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Difficulty Entity", () {
    test("convers fromModel", () {
      expect(DifficultyEntity.fromModel(1), DifficultyEntity.easy);
      expect(DifficultyEntity.fromModel(2), DifficultyEntity.medium);
      expect(DifficultyEntity.fromModel(3), DifficultyEntity.hard);
    });

    test("converts toModel", () {
      expect(DifficultyEntity.easy.toModel(), 1);
      expect(DifficultyEntity.medium.toModel(), 2);
      expect(DifficultyEntity.hard.toModel(), 3);
    });
  });
}
