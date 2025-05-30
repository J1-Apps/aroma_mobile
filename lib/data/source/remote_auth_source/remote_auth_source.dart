import "package:aroma_mobile/data/model/session_model.dart";

abstract class RemoteAuthSource {
  Stream<SessionModel> get sessionStream;
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> signOut();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> changePassword(String password);
  Future<void> deleteAccount();
}
