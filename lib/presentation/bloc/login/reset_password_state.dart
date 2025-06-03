import "package:aroma_mobile/data/model/error_model.dart";
import "package:dart_mappable/dart_mappable.dart";

part "reset_password_state.mapper.dart";

@MappableClass()
class ResetPasswordState with ResetPasswordStateMappable {
  final bool isLoading;
  final ErrorCode? error;

  const ResetPasswordState({
    this.isLoading = false,
    this.error,
  });
}
