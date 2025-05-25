import "package:aroma_mobile/data/model/aroma_error.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Aroma Error", () {
    test("is created from object", () {
      final aromaError = AromaError.fromObject(
        const AromaError(ErrorCode.source_local_theme_colorReadError, message: "test aroma message"),
      );

      final unknownError = AromaError.fromObject(ArgumentError("testArgumentMessage"));

      expect(aromaError.code, ErrorCode.source_local_theme_colorReadError);
      expect(aromaError.message, "test aroma message");
      expect(unknownError.code, ErrorCode.common_unknown);
      expect(unknownError.message, "Invalid argument(s): testArgumentMessage");
    });

    test("is printed to string", () {
      const unknownError = AromaError(ErrorCode.common_unknown, message: "test unknown message");
      const httpError = AromaError(ErrorCode.source_local_theme_colorReadError, message: "test color message");

      expect(unknownError.toString(), "AromaError(code: ErrorCode.common_unknown, message: test unknown message)");

      expect(
        httpError.toString(),
        "AromaError(code: ErrorCode.source_local_theme_colorReadError, message: test color message)",
      );
    });
  });
}
