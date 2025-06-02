import "dart:async";

import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class AuthRepository {
  Stream<AuthEntity> get authStream;

  Future<Result<void>> createUserWithEmailAndPassword(String email, String password);
  Future<Result<void>> signInWithEmailAndPassword(String email, String password);
  Future<Result<void>> signInWithGoogle();
  Future<Result<void>> signOut();
  Future<Result<void>> sendPasswordResetEmail(String email);
  Future<Result<void>> changePassword(String password);
  Future<Result<void>> deleteAccount();
}

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthSource _remoteAuthSource;

  AuthRepositoryImpl({
    RemoteAuthSource? remoteAuthSource,
  }) : _remoteAuthSource = remoteAuthSource ?? locator.get<RemoteAuthSource>();

  @override
  Stream<AuthEntity> get authStream => _remoteAuthSource.sessionStream.map(AuthEntity.fromModel);

  @override
  Future<Result<void>> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _remoteAuthSource.createUserWithEmailAndPassword(email, password);
      return const Success("");
    } catch (e) {
      return Failure(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<Result<void>> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _remoteAuthSource.signInWithEmailAndPassword(email, password);
      return const Success("");
    } catch (e) {
      return Failure(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<Result<void>> signInWithGoogle() async {
    try {
      await _remoteAuthSource.signInWithGoogle();
      return const Success("");
    } catch (e) {
      return Failure(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _remoteAuthSource.signOut();
      return const Success("");
    } catch (e) {
      return Failure(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    try {
      await _remoteAuthSource.sendPasswordResetEmail(email);
      return const Success("");
    } catch (e) {
      return Failure(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<Result<void>> changePassword(String password) async {
    try {
      await _remoteAuthSource.changePassword(password);
      return const Success("");
    } catch (e) {
      return Failure(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<Result<void>> deleteAccount() async {
    try {
      await _remoteAuthSource.deleteAccount();
      return const Success("");
    } catch (e) {
      return Failure(ErrorModel.fromObject(e));
    }
  }
}
