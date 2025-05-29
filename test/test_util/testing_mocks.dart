import "package:aroma_mobile/data/model/aroma_error.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";
import "package:shared_preferences/shared_preferences.dart";

// Custom Matchers

class HasErrorCode extends CustomMatcher {
  HasErrorCode(ErrorCode matcher) : super("AromaError with code that is", "code", matcher);

  @override
  Object? featureValueOf(actual) => (actual as AromaError).code;
}

// Mock Data Sources

class MockSharedPreferences extends Mock implements SharedPreferencesAsync {}
