import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/auth_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_google_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";
import "package:shared_preferences/shared_preferences.dart";

// Custom Matchers

class HasErrorCode extends CustomMatcher {
  HasErrorCode(ErrorCode matcher) : super("AromaError with code that is", "code", matcher);

  @override
  Object? featureValueOf(actual) => (actual as ErrorModel).code;
}

// Mock Data Sources

class MockSharedPreferences extends Mock implements SharedPreferencesAsync {}

class MockRemoteAuthSource extends Mock implements RemoteAuthSource {}

class MockLocalThemeSource extends Mock implements LocalThemeSource {}

// Mock Repositories

class MockAuthRepository extends Mock implements AuthRepository {}

// Mock Usecases

class MockAuthUsecase extends Mock implements AuthUsecase {}

class MockSignInGoogleUsecase extends Mock implements SignInGoogleUsecase {}
