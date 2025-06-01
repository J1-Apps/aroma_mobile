import "package:aroma_mobile/data/model/error_model.dart";
import "package:dart_mappable/dart_mappable.dart";

part "login_state.mapper.dart";

@MappableClass()
class LoginState with LoginStateMappable {
  final bool isLoading;
  final ErrorCode? error;

  const LoginState({this.isLoading = false, this.error});
}
