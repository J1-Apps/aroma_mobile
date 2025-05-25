// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'aroma_error.dart';

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
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ErrorCode self) {
    switch (self) {
      case ErrorCode.common_unknown:
        return r'common_unknown';
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
    }
  }
}

extension ErrorCodeMapperExtension on ErrorCode {
  String toValue() {
    ErrorCodeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ErrorCode>(this) as String;
  }
}

class AromaErrorMapper extends ClassMapperBase<AromaError> {
  AromaErrorMapper._();

  static AromaErrorMapper? _instance;
  static AromaErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AromaErrorMapper._());
      ErrorCodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AromaError';

  static ErrorCode _$code(AromaError v) => v.code;
  static const Field<AromaError, ErrorCode> _f$code = Field('code', _$code);
  static String _$message(AromaError v) => v.message;
  static const Field<AromaError, String> _f$message = Field('message', _$message, opt: true, def: "");

  @override
  final MappableFields<AromaError> fields = const {#code: _f$code, #message: _f$message};

  static AromaError _instantiate(DecodingData data) {
    return AromaError(data.dec(_f$code), message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static AromaError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AromaError>(map);
  }

  static AromaError fromJson(String json) {
    return ensureInitialized().decodeJson<AromaError>(json);
  }
}

mixin AromaErrorMappable {
  String toJson() {
    return AromaErrorMapper.ensureInitialized().encodeJson<AromaError>(this as AromaError);
  }

  Map<String, dynamic> toMap() {
    return AromaErrorMapper.ensureInitialized().encodeMap<AromaError>(this as AromaError);
  }

  AromaErrorCopyWith<AromaError, AromaError, AromaError> get copyWith =>
      _AromaErrorCopyWithImpl<AromaError, AromaError>(this as AromaError, $identity, $identity);
  @override
  String toString() {
    return AromaErrorMapper.ensureInitialized().stringifyValue(this as AromaError);
  }

  @override
  bool operator ==(Object other) {
    return AromaErrorMapper.ensureInitialized().equalsValue(this as AromaError, other);
  }

  @override
  int get hashCode {
    return AromaErrorMapper.ensureInitialized().hashValue(this as AromaError);
  }
}

extension AromaErrorValueCopy<$R, $Out> on ObjectCopyWith<$R, AromaError, $Out> {
  AromaErrorCopyWith<$R, AromaError, $Out> get $asAromaError =>
      $base.as((v, t, t2) => _AromaErrorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AromaErrorCopyWith<$R, $In extends AromaError, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({ErrorCode? code, String? message});
  AromaErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AromaErrorCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, AromaError, $Out>
    implements AromaErrorCopyWith<$R, AromaError, $Out> {
  _AromaErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AromaError> $mapper = AromaErrorMapper.ensureInitialized();
  @override
  $R call({ErrorCode? code, String? message}) =>
      $apply(FieldCopyWithData({if (code != null) #code: code, if (message != null) #message: message}));
  @override
  AromaError $make(CopyWithData data) => AromaError(
    data.get(#code, or: $value.code),
    message: data.get(#message, or: $value.message),
  );

  @override
  AromaErrorCopyWith<$R2, AromaError, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AromaErrorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
