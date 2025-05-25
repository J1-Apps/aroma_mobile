import "package:aroma_mobile/data/model/aroma_error.dart";
import "package:aroma_mobile/data/source/util/memory_source.dart";
import "package:flutter_test/flutter_test.dart";

import "../../../test_util/testing_mocks.dart";

class _TestSource extends MemorySource {
  _TestSource({super.initialShouldThrow, super.initialMsDelay});
}

void main() {
  group("Memory Source", () {
    late MemorySource source;

    setUp(() {
      source = _TestSource();
    });

    test("wrapRequest returns value when shouldThrow is false", () async {
      const testValue = "test value";
      final result = await source.wrapRequest(Future.value(testValue), ErrorCode.common_unknown);
      expect(result, testValue);
    });

    test("wrapRequest throws error when shouldThrow is true", () async {
      source.shouldThrow = true;
      const testValue = "test value";

      expect(
        () => source.wrapRequest(Future.value(testValue), ErrorCode.common_unknown),
        throwsA(HasErrorCode(ErrorCode.common_unknown)),
      );
    });

    test("reset sets shouldThrow to false", () {
      source.shouldThrow = true;
      source.reset();
      expect(source.shouldThrow, false);
    });
  });
}
