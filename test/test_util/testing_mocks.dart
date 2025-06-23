import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/local_language_source/local_language_source.dart";
import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/remote_recipe_source.dart";
import "package:aroma_mobile/data/source/remote_tag_source/remote_tag_source.dart";
import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/repository/language_repository.dart";
import "package:aroma_mobile/domain/repository/recipe_repository.dart";
import "package:aroma_mobile/domain/repository/tag_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/auth_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/create_user_email_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/reset_password_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_email_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_google_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_out_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/language_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/update_language_usecase.dart";
import "package:aroma_mobile/domain/usecase/recipe/delete_recipes_usecase.dart";
import "package:aroma_mobile/domain/usecase/recipe/recipes_usecase.dart";
import "package:aroma_mobile/domain/usecase/tag/tags_usecase.dart";
import "package:aroma_mobile/presentation/bloc/login/login_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/register_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_bloc.dart";
import "package:aroma_mobile/presentation/bloc/app/app_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_bloc.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:supabase_flutter/supabase_flutter.dart";

// Custom Matchers

class HasErrorCode extends CustomMatcher {
  HasErrorCode(ErrorCode matcher) : super("AromaError with code that is", "code", matcher);

  @override
  Object? featureValueOf(actual) => (actual as ErrorModel).code;
}

// Mock Callbacks

abstract class _MockVoidCallback {
  void call();
}

class MockVoidCallback extends Mock implements _MockVoidCallback {}

abstract class _MockCallback<T> {
  void call(T value);
}

class MockCallback<T> extends Mock implements _MockCallback<T> {}

// Mock Dependencies

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockAuthClient extends Mock implements GoTrueClient {}

class MockQueryBuilder extends Mock implements SupabaseQueryBuilder {}

class MockFilterBuilder extends Mock implements PostgrestFilterBuilder<PostgrestList> {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAuthentication extends Mock implements GoogleSignInAuthentication {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

// Mock Routing

class FakeBuildContext extends Fake implements BuildContext {}

class MockRouter extends Mock implements J1Router {}

class FakeEmptyRoute extends Fake implements J1Route<EmptyRouteConfig> {}

class FakeEmailPasswordRoute extends Fake implements J1Route<EmailPasswordRouteConfig> {}

class FakeEmailRoute extends Fake implements J1Route<EmailRouteConfig> {}

class FakeRecipeRoute extends Fake implements J1Route<RecipeRouteConfig> {}

// Mock Data Sources

class MockSharedPreferences extends Mock implements SharedPreferencesAsync {}

class MockRemoteAuthSource extends Mock implements RemoteAuthSource {}

class MockLocalThemeSource extends Mock implements LocalThemeSource {}

class MockLocalLanguageSource extends Mock implements LocalLanguageSource {}

class MockRemoteRecipeSource extends Mock implements RemoteRecipeSource {}

class MockRemoteTagSource extends Mock implements RemoteTagSource {}

// Mock Repositories

class MockThemeRepository extends Mock implements J1ThemeRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockLanguageRepository extends Mock implements LanguageRepository {}

class MockRecipeRepository extends Mock implements RecipeRepository {}

class MockTagRepository extends Mock implements TagRepository {}

// Mock Usecases

class MockAuthUsecase extends Mock implements AuthUsecase {}

class MockSignInGoogleUsecase extends Mock implements SignInGoogleUsecase {}

class MockSignInEmailUsecase extends Mock implements SignInEmailUsecase {}

class MockCreateUserEmailUsecase extends Mock implements CreateUserEmailUsecase {}

class MockResetPasswordUsecase extends Mock implements ResetPasswordUsecase {}

class MockSignOutUsecase extends Mock implements SignOutUsecase {}

class MockLanguageUsecase extends Mock implements LanguageUsecase {}

class MockUpdateLanguageUsecase extends Mock implements UpdateLanguageUsecase {}

class MockTagsUsecase extends Mock implements TagsUsecase {}

class MockRecipesUsecase extends Mock implements RecipesUsecase {}

class MockDeleteRecipesUsecase extends Mock implements DeleteRecipesUsecase {}

// Mock Blocs

class MockRouterBloc extends Mock implements AppBloc {}

class MockLoginBloc extends Mock implements LoginBloc {}

class MockSignInBloc extends Mock implements SignInBloc {}

class MockRegisterBloc extends Mock implements RegisterBloc {}

class MockResetPasswordBloc extends Mock implements ResetPasswordBloc {}

class MockSettingsBloc extends Mock implements SettingsBloc {}

class MockThemeBloc extends Mock implements J1ThemeBloc {}

class MockRecipesBloc extends Mock implements RecipesBloc {}
