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
  String get login_login_loginButton => 'Log In';

  @override
  String get login_login_registerButton => 'Register';

  @override
  String get login_login_loginWith => 'Log in with';

  @override
  String get login_login_disclaimers => 'By signing in, you agree to Aroma\'s ';

  @override
  String get login_login_termsOfUse => 'terms of use';

  @override
  String get login_login_and => ' and ';

  @override
  String get login_login_privacyPolicy => 'privacy policy';

  @override
  String get login_login_googleSignInFailed => 'Failed to sign in with google, please try again.';

  @override
  String get login_signIn_emailSignInFailed => 'Failed to sign in with email, please try again.';
}
