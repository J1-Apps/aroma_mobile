import "package:aroma_mobile/data/source/local_language_source/local_language_source.dart";
import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/remote_recipe_source.dart";
import "package:aroma_mobile/data/source/remote_tag_source/remote_tag_source.dart";
import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/repository/language_repository.dart";
import "package:aroma_mobile/domain/repository/recipe_repository.dart";
import "package:aroma_mobile/domain/repository/tag_repository.dart";
import "package:aroma_mobile/domain/repository/theme_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/auth_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/change_password_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/create_user_email_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/delete_account_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/reset_password_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_email_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_google_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_out_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/language_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/update_language_usecase.dart";
import "package:aroma_mobile/domain/usecase/recipe/delete_recipes_usecase.dart";
import "package:aroma_mobile/domain/usecase/recipe/recipes_usecase.dart";
import "package:aroma_mobile/domain/usecase/tag/tags_usecase.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:j1_core_firebase/j1_core_firebase.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:supabase_flutter/supabase_flutter.dart";

// This is a configuration file that doesn't need to be tested.
// coverage:ignore-file

abstract class AromaEnvironment extends J1EnvironmentFirebase {
  // Dependencies

  SharedPreferencesAsync? get sharedPreferencesAsync;
  SupabaseClient? get supabaseClient;
  GoogleSignIn? get googleSignIn;

  // Source

  LocalLanguageSource get localLanguageSource;
  LocalThemeSource get localThemeSource;
  RemoteAuthSource get remoteAuthSource;
  RemoteRecipeSource get remoteRecipeSource;
  RemoteTagSource get remoteTagSource;

  // Repository

  J1ThemeRepository get themeRepository => ThemeRepository();
  AuthRepository get authRepository => AuthRepositoryImpl();
  LanguageRepository get languageRepository => LanguageRepositoryImpl();
  RecipeRepository get recipeRepository => RecipeRepositoryImpl();
  TagRepository get tagRepository => TagRepositoryImpl();

  // Usecase

  AuthUsecase get authUsecase => AuthUsecaseImpl();
  CreateUserEmailUsecase get createUserEmailUsecase => CreateUserEmailUsecaseImpl();
  SignInEmailUsecase get signInEmailUsecase => SignInEmailUsecaseImpl();
  SignInGoogleUsecase get signInGoogleUsecase => SignInGoogleUsecaseImpl();
  SignOutUsecase get signOutUsecase => SignOutUsecaseImpl();
  ResetPasswordUsecase get resetPasswordUsecase => ResetPasswordUsecaseImpl();
  ChangePasswordUsecase get changePasswordUsecase => ChangePasswordUsecaseImpl();
  DeleteAccountUsecase get deleteAccountUsecase => DeleteAccountUsecaseImpl();
  LanguageUsecase get languageUsecase => LanguageUsecaseImpl();
  UpdateLanguageUsecase get updateLanguageUsecase => UpdateLanguageUsecaseImpl();
  TagsUsecase get tagsUsecase => TagsUsecaseImpl();
  RecipesUsecase get recipesUsecase => RecipesUsecaseImpl();
  DeleteRecipesUsecase get deleteRecipesUsecase => DeleteRecipesUsecaseImpl();

  @override
  Future<void> configure() async {
    await super.configure();

    // Dependencies

    if (sharedPreferencesAsync != null) {
      locator.registerSingleton<SharedPreferencesAsync>(sharedPreferencesAsync!);
    }

    if (supabaseClient != null) {
      locator.registerSingleton<SupabaseClient>(supabaseClient!);
    }

    if (googleSignIn != null) {
      locator.registerSingleton<GoogleSignIn>(googleSignIn!);
    }

    // Source

    locator.registerSingleton<LocalLanguageSource>(localLanguageSource);
    locator.registerSingleton<LocalThemeSource>(localThemeSource);
    locator.registerSingleton<RemoteAuthSource>(remoteAuthSource);
    locator.registerSingleton<RemoteRecipeSource>(remoteRecipeSource);
    locator.registerSingleton<RemoteTagSource>(remoteTagSource);

    // Repository

    locator.registerSingleton<J1ThemeRepository>(themeRepository);
    locator.registerSingleton<AuthRepository>(authRepository);
    locator.registerSingleton<LanguageRepository>(languageRepository);
    locator.registerSingleton<RecipeRepository>(recipeRepository);
    locator.registerSingleton<TagRepository>(tagRepository);

    // Usecase

    locator.registerFactory<AuthUsecase>(() => authUsecase);
    locator.registerFactory<CreateUserEmailUsecase>(() => createUserEmailUsecase);
    locator.registerFactory<SignInEmailUsecase>(() => signInEmailUsecase);
    locator.registerFactory<SignInGoogleUsecase>(() => signInGoogleUsecase);
    locator.registerFactory<SignOutUsecase>(() => signOutUsecase);
    locator.registerFactory<ResetPasswordUsecase>(() => resetPasswordUsecase);
    locator.registerFactory<ChangePasswordUsecase>(() => changePasswordUsecase);
    locator.registerFactory<DeleteAccountUsecase>(() => deleteAccountUsecase);
    locator.registerFactory<LanguageUsecase>(() => languageUsecase);
    locator.registerFactory<UpdateLanguageUsecase>(() => updateLanguageUsecase);
    locator.registerFactory<TagsUsecase>(() => tagsUsecase);
    locator.registerFactory<RecipesUsecase>(() => recipesUsecase);
    locator.registerFactory<DeleteRecipesUsecase>(() => deleteRecipesUsecase);
  }
}
