// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class StringsEn extends Strings {
  StringsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Aroma';

  @override
  String get login_loginButton => 'Log in';

  @override
  String get login_registerButton => 'Register';

  @override
  String get login_loginWith => 'Log in with';

  @override
  String get login_disclaimers => 'By signing in, you agree to Aroma\'s ';

  @override
  String get login_termsOfUse => 'terms of use';

  @override
  String get login_and => ' and ';

  @override
  String get login_privacyPolicy => 'privacy policy';

  @override
  String get login_googleSignInFailed => 'Failed to sign in with google, please try again.';

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_theme => 'Theme';

  @override
  String get settings_logout => 'Log out';

  @override
  String get settings_languageHint => 'Search';

  @override
  String settings_languageLabel(String language) {
    String _temp0 = intl.Intl.selectLogic(
      language,
      {
        'en': 'English',
        'ko': 'Korean',
        'other': 'Unknown',
      },
    );
    return '$_temp0';
  }

  @override
  String get settings_error_languageEmpty =>
      'Could not find any languages. Please ensure that you\'re searching by IANA language subtag (ie: \"en\", \"ko\", etc.) or language name and try again.';

  @override
  String get settings_error_getLanguage => 'Failed to fetch the current language. Using the default language.';

  @override
  String get settings_error_saveLanguage => 'Failed to save language.';

  @override
  String get signIn_loginButton => 'Log in';

  @override
  String get signIn_registerButton => 'Register';

  @override
  String get signIn_emailLabel => 'Email';

  @override
  String get signIn_passwordLabel => 'Password';

  @override
  String get signIn_resetPasswordPrompt => 'Forgot your password?';

  @override
  String get signIn_resetPasswordCta => 'Reset it here';

  @override
  String get signIn_emailSignInFailed => 'Failed to sign in with email, please try again.';

  @override
  String get register_emailLabel => 'Email';

  @override
  String get register_passwordLabel => 'Password';

  @override
  String get register_confirmPasswordLabel => 'Confirm password';

  @override
  String get register_registerButton => 'Register';

  @override
  String get register_passwordMismatch => 'Passwords do not match';

  @override
  String get register_emailSignUpFailed => 'Failed to sign up, please try again.';

  @override
  String get register_signInPrompt => 'Already have an account?';

  @override
  String get register_signInCta => 'Sign in';

  @override
  String get resetPassword_emailLabel => 'Email';

  @override
  String get resetPassword_resetPassword => 'Reset password';

  @override
  String get resetPassword_signInPrompt => 'Remembered your password?';

  @override
  String get resetPassword_signInCta => 'Sign in';

  @override
  String get resetPassword_resetPasswordSuccess => 'Password reset email sent, please check your email.';

  @override
  String get resetPassword_sendPasswordResetEmailFailed => 'Failed to send password reset email, please try again.';
}
