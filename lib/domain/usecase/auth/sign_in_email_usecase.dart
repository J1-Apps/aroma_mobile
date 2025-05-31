import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:j1_core_base/j1_environment/j1_environment.dart";

abstract class SignInEmailUsecase {
  Future<void> call(String email, String password);
}

class SignInEmailUsecaseImpl implements SignInEmailUsecase {
  final AuthRepository _authRepository;

  SignInEmailUsecaseImpl({AuthRepository? authRepository})
    : _authRepository = authRepository ?? locator.get<AuthRepository>();

  @override
  Future<void> call(String email, String password) => _authRepository.signInWithEmailAndPassword(email, password);
}
