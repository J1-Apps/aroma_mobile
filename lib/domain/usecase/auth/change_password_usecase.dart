import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class ChangePasswordUsecase {
  Future<Result<void>> call(String password);
}

class ChangePasswordUsecaseImpl implements ChangePasswordUsecase {
  final AuthRepository _authRepository;

  ChangePasswordUsecaseImpl({AuthRepository? authRepository})
    : _authRepository = authRepository ?? locator.get<AuthRepository>();

  @override
  Future<Result<void>> call(String password) => _authRepository.changePassword(password);
}
