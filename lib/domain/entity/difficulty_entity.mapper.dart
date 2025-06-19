// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'difficulty_entity.dart';

class DifficultyEntityMapper extends EnumMapper<DifficultyEntity> {
  DifficultyEntityMapper._();

  static DifficultyEntityMapper? _instance;
  static DifficultyEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DifficultyEntityMapper._());
    }
    return _instance!;
  }

  static DifficultyEntity fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DifficultyEntity decode(dynamic value) {
    switch (value) {
      case r'easy':
        return DifficultyEntity.easy;
      case r'medium':
        return DifficultyEntity.medium;
      case r'hard':
        return DifficultyEntity.hard;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(DifficultyEntity self) {
    switch (self) {
      case DifficultyEntity.easy:
        return r'easy';
      case DifficultyEntity.medium:
        return r'medium';
      case DifficultyEntity.hard:
        return r'hard';
    }
  }
}

extension DifficultyEntityMapperExtension on DifficultyEntity {
  String toValue() {
    DifficultyEntityMapper.ensureInitialized();
    return MapperContainer.globals.toValue<DifficultyEntity>(this) as String;
  }
}
