import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/model/session_model.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/data/source/util/memory_source.dart";
import "package:rxdart/rxdart.dart";

class MemoryRemoteAuthSource extends MemorySource implements RemoteAuthSource {
  final _stream = BehaviorSubject<SessionModel>();

  MemoryRemoteAuthSource({
    super.initialShouldThrow,
    super.initialMsDelay,
  });

  @override
  Stream<SessionModel> get sessionStream => _stream.stream;

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    await wrapRequest(
      Future.sync(() => _stream.add(SignedInSessionModel(userId: "1"))),
      ErrorCode.source_remote_auth_emailSignUpFailed,
    );
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await wrapRequest(
      Future.sync(() => _stream.add(SignedInSessionModel(userId: "1"))),
      ErrorCode.source_remote_auth_emailSignInFailed,
    );
  }

  @override
  Future<void> signInWithGoogle() async {
    await wrapRequest(
      Future.sync(() => _stream.add(SignedInSessionModel(userId: "2"))),
      ErrorCode.source_remote_auth_googleSignInFailed,
    );
  }

  @override
  Future<void> signOut() async {
    await wrapRequest(
      Future.sync(() => _stream.add(SignedOutSessionModel())),
      ErrorCode.source_remote_auth_signOutFailed,
    );
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await wrapRequest(
      Future.value(),
      ErrorCode.source_remote_auth_sendPasswordResetEmailFailed,
    );
  }

  @override
  Future<void> changePassword(String password) async {
    await wrapRequest(
      Future.value(),
      ErrorCode.source_remote_auth_changePasswordFailed,
    );
  }

  @override
  Future<void> deleteAccount() async {
    await wrapRequest(
      Future.sync(() => _stream.add(SignedOutSessionModel())),
      ErrorCode.source_remote_auth_deleteAccountFailed,
    );
  }

  @override
  void reset() {
    _stream.close();
    super.reset();
  }
}
