// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sort_model.dart';

class SortModelMapper extends EnumMapper<SortModel> {
  SortModelMapper._();

  static SortModelMapper? _instance;
  static SortModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SortModelMapper._());
    }
    return _instance!;
  }

  static SortModel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SortModel decode(dynamic value) {
    switch (value) {
      case r'none':
        return SortModel.none;
      case r'recentlyViewed':
        return SortModel.recentlyViewed;
      case r'rating':
        return SortModel.rating;
      case r'quickest':
        return SortModel.quickest;
      case r'easiest':
        return SortModel.easiest;
      case r'alphabetical':
        return SortModel.alphabetical;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SortModel self) {
    switch (self) {
      case SortModel.none:
        return r'none';
      case SortModel.recentlyViewed:
        return r'recentlyViewed';
      case SortModel.rating:
        return r'rating';
      case SortModel.quickest:
        return r'quickest';
      case SortModel.easiest:
        return r'easiest';
      case SortModel.alphabetical:
        return r'alphabetical';
    }
  }
}

extension SortModelMapperExtension on SortModel {
  String toValue() {
    SortModelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SortModel>(this) as String;
  }
}
