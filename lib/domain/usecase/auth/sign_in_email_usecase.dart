import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class SignInEmailUsecase {
  Future<Result<void>> call(String email, String password);
}

class SignInEmailUsecaseImpl implements SignInEmailUsecase {
  final AuthRepository _authRepository;

  SignInEmailUsecaseImpl({AuthRepository? authRepository})
    : _authRepository = authRepository ?? locator.get<AuthRepository>();

  @override
  Future<Result<void>> call(String email, String password) =>
      _authRepository.signInWithEmailAndPassword(email, password);
}
