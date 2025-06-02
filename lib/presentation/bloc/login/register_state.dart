import "package:aroma_mobile/data/model/error_model.dart";
import "package:dart_mappable/dart_mappable.dart";

part "register_state.mapper.dart";

@MappableClass()
class RegisterState with RegisterStateMappable {
  final bool isLoading;
  final ErrorCode? error;

  const RegisterState({this.isLoading = false, this.error});
}
