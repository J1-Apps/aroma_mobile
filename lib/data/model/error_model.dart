// ignore_for_file: constant_identifier_names
import "package:equatable/equatable.dart";

class ErrorModel extends Equatable implements Exception {
  final ErrorCode code;
  final String message;

  const ErrorModel(this.code, {this.message = ""});

  factory ErrorModel.fromObject(Object e) {
    if (e is ErrorModel) {
      return e;
    }

    return ErrorModel(ErrorCode.common_unknown, message: e.toString());
  }

  @override
  List<Object?> get props => [code, message];

  @override
  bool? get stringify => true;
}

enum ErrorCode {
  // Common error codes.
  common_unknown,

  // Repository error codes.

  // Source error codes.
  source_remote_auth_googleSignInFailed,
  source_remote_auth_emailSignInFailed,
  source_remote_auth_emailSignUpFailed,
  source_remote_auth_changePasswordFailed,
  source_remote_auth_deleteAccountFailed,
  source_remote_auth_signOutFailed,
  source_remote_auth_sendPasswordResetEmailFailed,

  source_local_theme_colorReadError,
  source_local_theme_colorWriteError,
  source_local_theme_textReadError,
  source_local_theme_textWriteError,
  source_local_theme_transitionReadError,
  source_local_theme_transitionWriteError,
}
