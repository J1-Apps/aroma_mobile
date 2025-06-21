import "package:aroma_mobile/data/model/sort_model.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Sort Entity", () {
    test("converts toModel", () {
      expect(SortEntity.none.toModel(), SortModel.none);
      expect(SortEntity.recentlyViewed.toModel(), SortModel.recentlyViewed);
      expect(SortEntity.rating.toModel(), SortModel.rating);
      expect(SortEntity.quickest.toModel(), SortModel.quickest);
      expect(SortEntity.easiest.toModel(), SortModel.easiest);
      expect(SortEntity.alphabetical.toModel(), SortModel.alphabetical);
    });
  });
}
