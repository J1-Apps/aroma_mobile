import "package:dart_mappable/dart_mappable.dart";

part "error_model.mapper.dart";

// ignore_for_file: constant_identifier_names

@MappableClass()
class ErrorModel with ErrorModelMappable implements Exception {
  final ErrorCode code;
  final String message;

  const ErrorModel(this.code, {this.message = ""});

  factory ErrorModel.fromObject(Object e) {
    if (e is ErrorModel) {
      return e;
    }

    return ErrorModel(ErrorCode.common_unknown, message: e.toString());
  }
}

@MappableEnum()
enum ErrorCode {
  // Common error codes.
  common_unknown,

  // Repository error codes.
  repository_auth_createUserWithEmailAndPasswordFailed,
  repository_auth_signInWithEmailAndPasswordFailed,
  repository_auth_signInWithGoogleFailed,
  repository_auth_signOutFailed,
  repository_auth_sendPasswordResetEmailFailed,
  repository_auth_changePasswordFailed,
  repository_auth_deleteAccountFailed,

  repository_language_loadFailed,
  repository_language_updateFailed,

  repository_recipe_getRecipesFailed,

  repository_tag_getTagsFailed,

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

  source_local_language_readError,
  source_local_language_writeError,

  source_remote_recipe_getRecipesFailed,

  source_remote_tag_getTagsFailed,
}

extension ExceptionExtension on Exception {
  ErrorCode get errorCode => ErrorModel.fromObject(this).code;
}
