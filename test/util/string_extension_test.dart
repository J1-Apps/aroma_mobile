import "package:aroma_mobile/util/string_extension.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("StringExtension", () {
    test("isBlank", () {
      expect("".isBlank, isTrue);
      expect(" ".isBlank, isTrue);
      expect("\n".isBlank, isTrue);
      expect("a".isBlank, isFalse);
      expect("a ".isBlank, isFalse);
      expect(" a".isBlank, isFalse);
      expect(" a ".isBlank, isFalse);
      expect(" a \n".isBlank, isFalse);
      expect(" a \n ".isBlank, isFalse);
      expect(" a \n b".isBlank, isFalse);
    });

    test("isNotBlank", () {
      expect("".isNotBlank, isFalse);
      expect(" ".isNotBlank, isFalse);
      expect("\n".isNotBlank, isFalse);
      expect("a".isNotBlank, isTrue);
      expect("a ".isNotBlank, isTrue);
      expect(" a".isNotBlank, isTrue);
      expect(" a ".isNotBlank, isTrue);
      expect(" a \n".isNotBlank, isTrue);
      expect(" a \n ".isNotBlank, isTrue);
      expect(" a \n b".isNotBlank, isTrue);
    });
  });
}
