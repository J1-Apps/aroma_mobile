import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class ResetPasswordUsecase {
  Future<void> call(String email);
}

class ResetPasswordUsecaseImpl implements ResetPasswordUsecase {
  final AuthRepository _authRepository;

  ResetPasswordUsecaseImpl({AuthRepository? authRepository})
    : _authRepository = authRepository ?? locator.get<AuthRepository>();

  @override
  Future<void> call(String email) => _authRepository.sendPasswordResetEmail(email);
}
