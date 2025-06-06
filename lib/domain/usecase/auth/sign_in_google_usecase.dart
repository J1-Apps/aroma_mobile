import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class SignInGoogleUsecase {
  Future<Result<void>> call();
}

class SignInGoogleUsecaseImpl implements SignInGoogleUsecase {
  final AuthRepository _authRepository;

  SignInGoogleUsecaseImpl({AuthRepository? authRepository})
    : _authRepository = authRepository ?? locator.get<AuthRepository>();

  @override
  Future<Result<void>> call() => _authRepository.signInWithGoogle();
}
