import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/repository/theme_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/auth_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/change_password_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/create_user_email_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/delete_account_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/reset_password_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_email_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_google_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_out_usecase.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:j1_core_firebase/j1_core_firebase.dart";

abstract class AromaEnvironment extends J1EnvironmentFirebase {
  // coverage:ignore-start

  // Source

  LocalThemeSource get localThemeSource;
  RemoteAuthSource get remoteAuthSource;

  // Repository

  J1ThemeRepository get themeRepository => ThemeRepository();
  AuthRepository get authRepository => AuthRepositoryImpl();

  // Usecase

  AuthUsecase get authUsecase => AuthUsecaseImpl();
  CreateUserEmailUsecase get createUserEmailUsecase => CreateUserEmailUsecaseImpl();
  SignInEmailUsecase get signInEmailUsecase => SignInEmailUsecaseImpl();
  SignInGoogleUsecase get signInGoogleUsecase => SignInGoogleUsecaseImpl();
  SignOutUsecase get signOutUsecase => SignOutUsecaseImpl();
  ResetPasswordUsecase get resetPasswordUsecase => ResetPasswordUsecaseImpl();
  ChangePasswordUsecase get changePasswordUsecase => ChangePasswordUsecaseImpl();
  DeleteAccountUsecase get deleteAccountUsecase => DeleteAccountUsecaseImpl();

  // coverage:ignore-end

  @override
  Future<void> configure() async {
    await super.configure();

    // Source

    locator.registerSingleton<LocalThemeSource>(localThemeSource);
    locator.registerSingleton<RemoteAuthSource>(remoteAuthSource);

    // Repository

    locator.registerSingleton<J1ThemeRepository>(themeRepository);
    locator.registerSingleton<AuthRepository>(authRepository);

    // Usecase

    locator.registerFactory<AuthUsecase>(() => authUsecase);
    locator.registerFactory<CreateUserEmailUsecase>(() => createUserEmailUsecase);
    locator.registerFactory<SignInEmailUsecase>(() => signInEmailUsecase);
    locator.registerFactory<SignInGoogleUsecase>(() => signInGoogleUsecase);
    locator.registerFactory<SignOutUsecase>(() => signOutUsecase);
    locator.registerFactory<ResetPasswordUsecase>(() => resetPasswordUsecase);
    locator.registerFactory<ChangePasswordUsecase>(() => changePasswordUsecase);
    locator.registerFactory<DeleteAccountUsecase>(() => deleteAccountUsecase);

    // Initialize repositories

    await authRepository.init();
  }
}
