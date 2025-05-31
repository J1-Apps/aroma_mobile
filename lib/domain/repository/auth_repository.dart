import "dart:async";

import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/model/session_model.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:j1_core_base/j1_environment/j1_environment.dart";
import "package:rxdart/subjects.dart";

abstract class AuthRepository {
  Stream<AuthEntity> get sessions;

  Future<void> init();
  Future<void> dispose();

  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> signOut();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> changePassword(String password);
  Future<void> deleteAccount();
}

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthSource _remoteAuthSource;
  final BehaviorSubject<AuthEntity> _sessionSubject = BehaviorSubject<AuthEntity>();
  late final StreamSubscription<SessionModel>? _sessionSubscription;

  AuthRepositoryImpl({
    RemoteAuthSource? remoteAuthSource,
  }) : _remoteAuthSource = remoteAuthSource ?? locator.get<RemoteAuthSource>();

  @override
  Stream<AuthEntity> get sessions => _sessionSubject.stream;

  @override
  Future<void> init() async {
    _sessionSubscription = _remoteAuthSource.sessionStream.listen(
      (session) => _sessionSubject.add(AuthEntity.fromModel(session)),
      onError: (error, _) => _sessionSubject.addError(error),
      onDone: () => _sessionSubject.add(AuthEntitySignedOut()),
    );
  }

  @override
  Future<void> dispose() async {
    _sessionSubject.close();
    await _sessionSubscription?.cancel();
  }

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _remoteAuthSource.createUserWithEmailAndPassword(email, password);
    } catch (e) {
      _sessionSubject.addError(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _remoteAuthSource.signInWithEmailAndPassword(email, password);
    } catch (e) {
      _sessionSubject.addError(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      await _remoteAuthSource.signInWithGoogle();
    } catch (e) {
      _sessionSubject.addError(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _remoteAuthSource.signOut();
    } catch (e) {
      _sessionSubject.addError(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _remoteAuthSource.sendPasswordResetEmail(email);
    } catch (e) {
      _sessionSubject.addError(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<void> changePassword(String password) async {
    try {
      await _remoteAuthSource.changePassword(password);
    } catch (e) {
      _sessionSubject.addError(ErrorModel.fromObject(e));
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      await _remoteAuthSource.deleteAccount();
    } catch (e) {
      _sessionSubject.addError(ErrorModel.fromObject(e));
    }
  }
}
