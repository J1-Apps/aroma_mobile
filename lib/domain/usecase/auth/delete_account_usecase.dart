import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class DeleteAccountUsecase {
  Future<Result<void>> call();
}

class DeleteAccountUsecaseImpl implements DeleteAccountUsecase {
  final AuthRepository _authRepository;

  DeleteAccountUsecaseImpl({AuthRepository? authRepository})
    : _authRepository = authRepository ?? locator.get<AuthRepository>();

  @override
  Future<Result<void>> call() => _authRepository.deleteAccount();
}
