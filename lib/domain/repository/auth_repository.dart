import "dart:async";

import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/model/session_model.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:get_it/get_it.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:rxdart/subjects.dart";

abstract class AuthRepository implements Disposable {
  Stream<AuthEntity> get authStream;

  Future<void> init();

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
  final BehaviorSubject<AuthEntity> _sessionSubject = BehaviorSubject<AuthEntity>.seeded(AuthEntitySignedOut());
  late final StreamSubscription<SessionModel>? _sessionSubscription;

  AuthRepositoryImpl({
    RemoteAuthSource? remoteAuthSource,
  }) : _remoteAuthSource = remoteAuthSource ?? locator.get<RemoteAuthSource>();

  @override
  Stream<AuthEntity> get authStream => _sessionSubject.stream;

  @override
  Future<void> init() async {
    _sessionSubscription = _remoteAuthSource.sessionStream.listen(
      (session) => _sessionSubject.add(AuthEntity.fromModel(session)),
      onError: (error, _) => _sessionSubject.addError(error),
    );
  }

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

  @override
  FutureOr<void> onDispose() async {
    await _sessionSubject.close();
    await _sessionSubscription?.cancel();
  }
}
