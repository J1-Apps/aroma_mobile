import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/local_language_source/local_language_source.dart";
import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/repository/language_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/auth_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/create_user_email_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/reset_password_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_email_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_google_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_out_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/language_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/update_language_usecase.dart";
import "package:aroma_mobile/presentation/bloc/login/login_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/register_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_bloc.dart";
import "package:aroma_mobile/presentation/bloc/app/app_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";
import "package:shared_preferences/shared_preferences.dart";

// Custom Matchers

class HasErrorCode extends CustomMatcher {
  HasErrorCode(ErrorCode matcher) : super("AromaError with code that is", "code", matcher);

  @override
  Object? featureValueOf(actual) => (actual as ErrorModel).code;
}

class FakeBuildContext extends Fake implements BuildContext {}

class MockRouter extends Mock implements J1Router {}

// Mock Data Sources

class MockSharedPreferences extends Mock implements SharedPreferencesAsync {}

class MockRemoteAuthSource extends Mock implements RemoteAuthSource {}

class MockLocalThemeSource extends Mock implements LocalThemeSource {}

class MockLocalLanguageSource extends Mock implements LocalLanguageSource {}

// Mock Repositories

class MockAuthRepository extends Mock implements AuthRepository {}

class MockLanguageRepository extends Mock implements LanguageRepository {}

// Mock Usecases

class MockAuthUsecase extends Mock implements AuthUsecase {}

class MockSignInGoogleUsecase extends Mock implements SignInGoogleUsecase {}

class MockSignInEmailUsecase extends Mock implements SignInEmailUsecase {}

class MockCreateUserEmailUsecase extends Mock implements CreateUserEmailUsecase {}

class MockResetPasswordUsecase extends Mock implements ResetPasswordUsecase {}

class MockSignOutUsecase extends Mock implements SignOutUsecase {}

class MockLanguageUsecase extends Mock implements LanguageUsecase {}

class MockUpdateLanguageUsecase extends Mock implements UpdateLanguageUsecase {}

// Mock Blocs

class MockRouterBloc extends Mock implements AppBloc {}

class MockLoginBloc extends Mock implements LoginBloc {}

class MockSignInBloc extends Mock implements SignInBloc {}

class MockRegisterBloc extends Mock implements RegisterBloc {}

class MockResetPasswordBloc extends Mock implements ResetPasswordBloc {}
