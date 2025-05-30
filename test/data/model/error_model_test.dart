import "package:aroma_mobile/data/model/error_model.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Error Model", () {
    test("is created from object", () {
      final error = ErrorModel.fromObject(
        const ErrorModel(ErrorCode.source_local_theme_colorReadError, message: "test aroma message"),
      );

      final unknownError = ErrorModel.fromObject(ArgumentError("testArgumentMessage"));

      expect(error.code, ErrorCode.source_local_theme_colorReadError);
      expect(error.message, "test aroma message");
      expect(unknownError.code, ErrorCode.common_unknown);
      expect(unknownError.message, "Invalid argument(s): testArgumentMessage");
    });

    test("is printed to string", () {
      const unknownError = ErrorModel(ErrorCode.common_unknown, message: "test unknown message");
      const httpError = ErrorModel(ErrorCode.source_local_theme_colorReadError, message: "test color message");

      expect(unknownError.toString(), "ErrorModel(ErrorCode.common_unknown, test unknown message)");
      expect(httpError.toString(), "ErrorModel(ErrorCode.source_local_theme_colorReadError, test color message)");
    });
  });
}
