// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sort_entity.dart';

class SortEntityMapper extends EnumMapper<SortEntity> {
  SortEntityMapper._();

  static SortEntityMapper? _instance;
  static SortEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SortEntityMapper._());
    }
    return _instance!;
  }

  static SortEntity fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SortEntity decode(dynamic value) {
    switch (value) {
      case r'recentlyViewed':
        return SortEntity.recentlyViewed;
      case r'rating':
        return SortEntity.rating;
      case r'quickest':
        return SortEntity.quickest;
      case r'easiest':
        return SortEntity.easiest;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SortEntity self) {
    switch (self) {
      case SortEntity.recentlyViewed:
        return r'recentlyViewed';
      case SortEntity.rating:
        return r'rating';
      case SortEntity.quickest:
        return r'quickest';
      case SortEntity.easiest:
        return r'easiest';
    }
  }
}

extension SortEntityMapperExtension on SortEntity {
  String toValue() {
    SortEntityMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SortEntity>(this) as String;
  }
}
