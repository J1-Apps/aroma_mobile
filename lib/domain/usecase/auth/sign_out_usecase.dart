import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class SignOutUsecase {
  Future<Result<void>> call();
}

class SignOutUsecaseImpl implements SignOutUsecase {
  final AuthRepository _authRepository;

  SignOutUsecaseImpl({AuthRepository? authRepository})
    : _authRepository = authRepository ?? locator.get<AuthRepository>();

  @override
  Future<Result<void>> call() => _authRepository.signOut();
}
