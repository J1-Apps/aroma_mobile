// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'error_model.dart';

class ErrorCodeMapper extends EnumMapper<ErrorCode> {
  ErrorCodeMapper._();

  static ErrorCodeMapper? _instance;
  static ErrorCodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ErrorCodeMapper._());
    }
    return _instance!;
  }

  static ErrorCode fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ErrorCode decode(dynamic value) {
    switch (value) {
      case r'common_unknown':
        return ErrorCode.common_unknown;
      case r'repository_auth_createUserWithEmailAndPasswordFailed':
        return ErrorCode.repository_auth_createUserWithEmailAndPasswordFailed;
      case r'repository_auth_signInWithEmailAndPasswordFailed':
        return ErrorCode.repository_auth_signInWithEmailAndPasswordFailed;
      case r'repository_auth_signInWithGoogleFailed':
        return ErrorCode.repository_auth_signInWithGoogleFailed;
      case r'repository_auth_signOutFailed':
        return ErrorCode.repository_auth_signOutFailed;
      case r'repository_auth_sendPasswordResetEmailFailed':
        return ErrorCode.repository_auth_sendPasswordResetEmailFailed;
      case r'repository_auth_changePasswordFailed':
        return ErrorCode.repository_auth_changePasswordFailed;
      case r'repository_auth_deleteAccountFailed':
        return ErrorCode.repository_auth_deleteAccountFailed;
      case r'repository_language_loadFailed':
        return ErrorCode.repository_language_loadFailed;
      case r'repository_language_updateFailed':
        return ErrorCode.repository_language_updateFailed;
      case r'repository_recipe_getRecipesFailed':
        return ErrorCode.repository_recipe_getRecipesFailed;
      case r'repository_recipe_deleteRecipesFailed':
        return ErrorCode.repository_recipe_deleteRecipesFailed;
      case r'repository_tag_getTagsFailed':
        return ErrorCode.repository_tag_getTagsFailed;
      case r'source_remote_auth_googleSignInFailed':
        return ErrorCode.source_remote_auth_googleSignInFailed;
      case r'source_remote_auth_emailSignInFailed':
        return ErrorCode.source_remote_auth_emailSignInFailed;
      case r'source_remote_auth_emailSignUpFailed':
        return ErrorCode.source_remote_auth_emailSignUpFailed;
      case r'source_remote_auth_changePasswordFailed':
        return ErrorCode.source_remote_auth_changePasswordFailed;
      case r'source_remote_auth_deleteAccountFailed':
        return ErrorCode.source_remote_auth_deleteAccountFailed;
      case r'source_remote_auth_signOutFailed':
        return ErrorCode.source_remote_auth_signOutFailed;
      case r'source_remote_auth_sendPasswordResetEmailFailed':
        return ErrorCode.source_remote_auth_sendPasswordResetEmailFailed;
      case r'source_local_theme_colorReadError':
        return ErrorCode.source_local_theme_colorReadError;
      case r'source_local_theme_colorWriteError':
        return ErrorCode.source_local_theme_colorWriteError;
      case r'source_local_theme_textReadError':
        return ErrorCode.source_local_theme_textReadError;
      case r'source_local_theme_textWriteError':
        return ErrorCode.source_local_theme_textWriteError;
      case r'source_local_theme_transitionReadError':
        return ErrorCode.source_local_theme_transitionReadError;
      case r'source_local_theme_transitionWriteError':
        return ErrorCode.source_local_theme_transitionWriteError;
      case r'source_local_language_readError':
        return ErrorCode.source_local_language_readError;
      case r'source_local_language_writeError':
        return ErrorCode.source_local_language_writeError;
      case r'source_remote_recipe_getRecipesFailed':
        return ErrorCode.source_remote_recipe_getRecipesFailed;
      case r'source_remote_recipe_deleteRecipesFailed':
        return ErrorCode.source_remote_recipe_deleteRecipesFailed;
      case r'source_remote_tag_getTagsFailed':
        return ErrorCode.source_remote_tag_getTagsFailed;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ErrorCode self) {
    switch (self) {
      case ErrorCode.common_unknown:
        return r'common_unknown';
      case ErrorCode.repository_auth_createUserWithEmailAndPasswordFailed:
        return r'repository_auth_createUserWithEmailAndPasswordFailed';
      case ErrorCode.repository_auth_signInWithEmailAndPasswordFailed:
        return r'repository_auth_signInWithEmailAndPasswordFailed';
      case ErrorCode.repository_auth_signInWithGoogleFailed:
        return r'repository_auth_signInWithGoogleFailed';
      case ErrorCode.repository_auth_signOutFailed:
        return r'repository_auth_signOutFailed';
      case ErrorCode.repository_auth_sendPasswordResetEmailFailed:
        return r'repository_auth_sendPasswordResetEmailFailed';
      case ErrorCode.repository_auth_changePasswordFailed:
        return r'repository_auth_changePasswordFailed';
      case ErrorCode.repository_auth_deleteAccountFailed:
        return r'repository_auth_deleteAccountFailed';
      case ErrorCode.repository_language_loadFailed:
        return r'repository_language_loadFailed';
      case ErrorCode.repository_language_updateFailed:
        return r'repository_language_updateFailed';
      case ErrorCode.repository_recipe_getRecipesFailed:
        return r'repository_recipe_getRecipesFailed';
      case ErrorCode.repository_recipe_deleteRecipesFailed:
        return r'repository_recipe_deleteRecipesFailed';
      case ErrorCode.repository_tag_getTagsFailed:
        return r'repository_tag_getTagsFailed';
      case ErrorCode.source_remote_auth_googleSignInFailed:
        return r'source_remote_auth_googleSignInFailed';
      case ErrorCode.source_remote_auth_emailSignInFailed:
        return r'source_remote_auth_emailSignInFailed';
      case ErrorCode.source_remote_auth_emailSignUpFailed:
        return r'source_remote_auth_emailSignUpFailed';
      case ErrorCode.source_remote_auth_changePasswordFailed:
        return r'source_remote_auth_changePasswordFailed';
      case ErrorCode.source_remote_auth_deleteAccountFailed:
        return r'source_remote_auth_deleteAccountFailed';
      case ErrorCode.source_remote_auth_signOutFailed:
        return r'source_remote_auth_signOutFailed';
      case ErrorCode.source_remote_auth_sendPasswordResetEmailFailed:
        return r'source_remote_auth_sendPasswordResetEmailFailed';
      case ErrorCode.source_local_theme_colorReadError:
        return r'source_local_theme_colorReadError';
      case ErrorCode.source_local_theme_colorWriteError:
        return r'source_local_theme_colorWriteError';
      case ErrorCode.source_local_theme_textReadError:
        return r'source_local_theme_textReadError';
      case ErrorCode.source_local_theme_textWriteError:
        return r'source_local_theme_textWriteError';
      case ErrorCode.source_local_theme_transitionReadError:
        return r'source_local_theme_transitionReadError';
      case ErrorCode.source_local_theme_transitionWriteError:
        return r'source_local_theme_transitionWriteError';
      case ErrorCode.source_local_language_readError:
        return r'source_local_language_readError';
      case ErrorCode.source_local_language_writeError:
        return r'source_local_language_writeError';
      case ErrorCode.source_remote_recipe_getRecipesFailed:
        return r'source_remote_recipe_getRecipesFailed';
      case ErrorCode.source_remote_recipe_deleteRecipesFailed:
        return r'source_remote_recipe_deleteRecipesFailed';
      case ErrorCode.source_remote_tag_getTagsFailed:
        return r'source_remote_tag_getTagsFailed';
    }
  }
}

extension ErrorCodeMapperExtension on ErrorCode {
  String toValue() {
    ErrorCodeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ErrorCode>(this) as String;
  }
}

class ErrorModelMapper extends ClassMapperBase<ErrorModel> {
  ErrorModelMapper._();

  static ErrorModelMapper? _instance;
  static ErrorModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ErrorModelMapper._());
      ErrorCodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ErrorModel';

  static ErrorCode _$code(ErrorModel v) => v.code;
  static const Field<ErrorModel, ErrorCode> _f$code = Field('code', _$code);
  static String _$message(ErrorModel v) => v.message;
  static const Field<ErrorModel, String> _f$message = Field('message', _$message, opt: true, def: "");

  @override
  final MappableFields<ErrorModel> fields = const {
    #code: _f$code,
    #message: _f$message,
  };

  static ErrorModel _instantiate(DecodingData data) {
    return ErrorModel(data.dec(_f$code), message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static ErrorModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ErrorModel>(map);
  }

  static ErrorModel fromJson(String json) {
    return ensureInitialized().decodeJson<ErrorModel>(json);
  }
}

mixin ErrorModelMappable {
  String toJson() {
    return ErrorModelMapper.ensureInitialized().encodeJson<ErrorModel>(this as ErrorModel);
  }

  Map<String, dynamic> toMap() {
    return ErrorModelMapper.ensureInitialized().encodeMap<ErrorModel>(this as ErrorModel);
  }

  ErrorModelCopyWith<ErrorModel, ErrorModel, ErrorModel> get copyWith =>
      _ErrorModelCopyWithImpl<ErrorModel, ErrorModel>(this as ErrorModel, $identity, $identity);
  @override
  String toString() {
    return ErrorModelMapper.ensureInitialized().stringifyValue(this as ErrorModel);
  }

  @override
  bool operator ==(Object other) {
    return ErrorModelMapper.ensureInitialized().equalsValue(this as ErrorModel, other);
  }

  @override
  int get hashCode {
    return ErrorModelMapper.ensureInitialized().hashValue(this as ErrorModel);
  }
}

extension ErrorModelValueCopy<$R, $Out> on ObjectCopyWith<$R, ErrorModel, $Out> {
  ErrorModelCopyWith<$R, ErrorModel, $Out> get $asErrorModel =>
      $base.as((v, t, t2) => _ErrorModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ErrorModelCopyWith<$R, $In extends ErrorModel, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({ErrorCode? code, String? message});
  ErrorModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ErrorModelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, ErrorModel, $Out>
    implements ErrorModelCopyWith<$R, ErrorModel, $Out> {
  _ErrorModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ErrorModel> $mapper = ErrorModelMapper.ensureInitialized();
  @override
  $R call({ErrorCode? code, String? message}) =>
      $apply(FieldCopyWithData({if (code != null) #code: code, if (message != null) #message: message}));
  @override
  ErrorModel $make(CopyWithData data) => ErrorModel(
    data.get(#code, or: $value.code),
    message: data.get(#message, or: $value.message),
  );

  @override
  ErrorModelCopyWith<$R2, ErrorModel, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ErrorModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
