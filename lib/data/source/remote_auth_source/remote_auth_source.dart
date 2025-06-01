import "package:aroma_mobile/data/model/session_model.dart";
import "package:get_it/get_it.dart";

abstract class RemoteAuthSource implements Disposable {
  Stream<SessionModel> get sessionStream;
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> signOut();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> changePassword(String password);
  Future<void> deleteAccount();
}
