import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class CreateUserEmailUsecase {
  Future<Result<void>> call(String email, String password);
}

class CreateUserEmailUsecaseImpl implements CreateUserEmailUsecase {
  final AuthRepository _authRepository;

  CreateUserEmailUsecaseImpl({AuthRepository? authRepository})
    : _authRepository = authRepository ?? locator.get<AuthRepository>();

  @override
  Future<Result<void>> call(String email, String password) =>
      _authRepository.createUserWithEmailAndPassword(email, password);
}
