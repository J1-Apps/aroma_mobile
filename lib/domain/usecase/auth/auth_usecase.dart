import "dart:async";

import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class AuthUsecase {
  Stream<AuthEntity> call();
}

class AuthUsecaseImpl implements AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecaseImpl({AuthRepository? authRepository}) : _authRepository = authRepository ?? locator.get<AuthRepository>();

  @override
  Stream<AuthEntity> call() => _authRepository.authStream;
}
