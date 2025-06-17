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
  String get settings_error_signOut => 'Failed to sign out. Please try again.';

  @override
  String get theme_title => 'Theme';

  @override
  String get theme_headerFonts => 'Header Fonts';

  @override
  String get theme_bodyFonts => 'Body Fonts';

  @override
  String theme_colorsTitle(String colors) {
    String _temp0 = intl.Intl.selectLogic(
      colors,
      {
        'light': 'Light',
        'dark': 'Dark',
        'blue': 'Blue',
        'green': 'Green',
        'other': 'Unknown',
      },
    );
    return '$_temp0';
  }

  @override
  String theme_fontTitle(String font) {
    String _temp0 = intl.Intl.selectLogic(
      font,
      {
        'crimsonText': 'Crimson Text',
        'poppins': 'Poppins',
        'other': 'Unknown',
      },
    );
    return '$_temp0';
  }

  @override
  String get feed_title => 'Feed';

  @override
  String get recipes_title => 'Recipes';

  @override
  String get recipes_searchHint => 'Search recipes';

  @override
  String get recipes_loadError =>
      'Sorry, we encountered an error loading your recipes. Please refresh the page or check back again later.';

  @override
  String get recipes_loadErrorRefresh => 'Refresh';

  @override
  String get recipes_loadEmpty => 'Looks like you don’t have any recipes yet. Let’s get cooking!';

  @override
  String get recipes_loadEmptyCreate => 'Create';

  @override
  String get recipes_sortFilterHint => 'Sort and filter';

  @override
  String get recipes_sort_none => 'None';

  @override
  String get recipes_sort_recentlyViewed => 'Recently viewed';

  @override
  String get recipes_sort_rating => 'Rating';

  @override
  String get recipes_sort_quickest => 'Quickest';

  @override
  String get recipes_sort_easiest => 'Easiest';

  @override
  String get recipes_sort_alphabetical => 'Alphabetical';

  @override
  String recipes_filter_timeEqual(int time) {
    return 'Time = ${time}m';
  }

  @override
  String recipes_filter_timeMin(int time) {
    return 'Time > ${time}m';
  }

  @override
  String recipes_filter_timeMax(int time) {
    return 'Time < ${time}m';
  }

  @override
  String recipes_filter_ratingMin(double rating) {
    return 'Rating > $rating';
  }

  @override
  String recipes_filter_servingsEqual(int servings) {
    return 'Servings = $servings';
  }

  @override
  String recipes_filter_servingsMin(int servings) {
    return 'Servings > $servings';
  }

  @override
  String recipes_filter_servingsMax(int servings) {
    return 'Servings < $servings';
  }

  @override
  String get recipes_filter_difficultyEasy => 'Easy';

  @override
  String get recipes_filter_difficultyMedium => 'Medium';

  @override
  String get recipes_filter_difficultyHard => 'Hard';

  @override
  String get recipes_filter_reset => 'Reset';

  @override
  String get recipes_filter_apply => 'Apply';

  @override
  String get recipes_drawer_sortTitle => 'Sort by';

  @override
  String get recipes_drawer_ratingTitle => 'Rating';

  @override
  String get recipes_drawer_timeTitle => 'Time';

  @override
  String get recipes_drawer_servingsTitle => 'Servings';

  @override
  String get recipes_drawer_difficultyTitle => 'Difficulty';

  @override
  String get recipes_drawer_tagsTitle => 'Tags';

  @override
  String get profile_title => 'Profile';
}
