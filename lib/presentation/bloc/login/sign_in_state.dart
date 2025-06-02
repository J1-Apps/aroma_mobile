import "package:aroma_mobile/data/model/error_model.dart";
import "package:dart_mappable/dart_mappable.dart";

part "sign_in_state.mapper.dart";

@MappableClass()
class SignInState with SignInStateMappable {
  final bool isLoading;
  final ErrorCode? error;

  const SignInState({this.isLoading = false, this.error});
}
