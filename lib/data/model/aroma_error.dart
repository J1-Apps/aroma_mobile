import "package:dart_mappable/dart_mappable.dart";

part "aroma_error.mapper.dart";

// ignore_for_file: constant_identifier_names
@MappableClass()
class AromaError with AromaErrorMappable implements Exception {
  final ErrorCode code;
  final String message;

  const AromaError(this.code, {this.message = ""});

  factory AromaError.fromObject(Object e) {
    if (e is AromaError) {
      return e;
    }

    return AromaError(ErrorCode.common_unknown, message: e.toString());
  }
}

@MappableEnum()
enum ErrorCode {
  // Common error codes.
  common_unknown,

  // Repository error codes.

  // Source error codes.
  source_local_theme_colorReadError,
  source_local_theme_colorWriteError,
  source_local_theme_textReadError,
  source_local_theme_textWriteError,
  source_local_theme_transitionReadError,
  source_local_theme_transitionWriteError,
}
