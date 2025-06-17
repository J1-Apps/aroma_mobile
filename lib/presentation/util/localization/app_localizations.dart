import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of Strings
/// returned by `Strings.of(context)`.
///
/// Applications need to include `Strings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Strings.localizationsDelegates,
///   supportedLocales: Strings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Strings.supportedLocales
/// property.
abstract class Strings {
  Strings(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings)!;
  }

  static const LocalizationsDelegate<Strings> delegate = _StringsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('ko')];

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'Aroma'**
  String get app_title;

  /// No description provided for @login_loginButton.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login_loginButton;

  /// No description provided for @login_registerButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get login_registerButton;

  /// No description provided for @login_loginWith.
  ///
  /// In en, this message translates to:
  /// **'Log in with'**
  String get login_loginWith;

  /// No description provided for @login_disclaimers.
  ///
  /// In en, this message translates to:
  /// **'By signing in, you agree to Aroma\'s '**
  String get login_disclaimers;

  /// No description provided for @login_termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'terms of use'**
  String get login_termsOfUse;

  /// No description provided for @login_and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get login_and;

  /// No description provided for @login_privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'privacy policy'**
  String get login_privacyPolicy;

  /// No description provided for @login_googleSignInFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to sign in with google, please try again.'**
  String get login_googleSignInFailed;

  /// No description provided for @signIn_loginButton.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get signIn_loginButton;

  /// No description provided for @signIn_registerButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get signIn_registerButton;

  /// No description provided for @signIn_emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signIn_emailLabel;

  /// No description provided for @signIn_passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signIn_passwordLabel;

  /// No description provided for @signIn_resetPasswordPrompt.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get signIn_resetPasswordPrompt;

  /// No description provided for @signIn_resetPasswordCta.
  ///
  /// In en, this message translates to:
  /// **'Reset it here'**
  String get signIn_resetPasswordCta;

  /// No description provided for @signIn_emailSignInFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to sign in with email, please try again.'**
  String get signIn_emailSignInFailed;

  /// No description provided for @register_emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get register_emailLabel;

  /// No description provided for @register_passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get register_passwordLabel;

  /// No description provided for @register_confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get register_confirmPasswordLabel;

  /// No description provided for @register_registerButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register_registerButton;

  /// No description provided for @register_passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get register_passwordMismatch;

  /// No description provided for @register_emailSignUpFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to sign up, please try again.'**
  String get register_emailSignUpFailed;

  /// No description provided for @register_signInPrompt.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get register_signInPrompt;

  /// No description provided for @register_signInCta.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get register_signInCta;

  /// No description provided for @resetPassword_emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get resetPassword_emailLabel;

  /// No description provided for @resetPassword_resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword_resetPassword;

  /// No description provided for @resetPassword_signInPrompt.
  ///
  /// In en, this message translates to:
  /// **'Remembered your password?'**
  String get resetPassword_signInPrompt;

  /// No description provided for @resetPassword_signInCta.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get resetPassword_signInCta;

  /// No description provided for @resetPassword_resetPasswordSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent, please check your email.'**
  String get resetPassword_resetPasswordSuccess;

  /// No description provided for @resetPassword_sendPasswordResetEmailFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to send password reset email, please try again.'**
  String get resetPassword_sendPasswordResetEmailFailed;

  /// No description provided for @settings_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_title;

  /// No description provided for @settings_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language;

  /// No description provided for @settings_theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settings_theme;

  /// No description provided for @settings_logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get settings_logout;

  /// No description provided for @settings_languageHint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get settings_languageHint;

  /// No description provided for @settings_languageLabel.
  ///
  /// In en, this message translates to:
  /// **'{language, select, en{English} ko{Korean} other{Unknown}}'**
  String settings_languageLabel(String language);

  /// No description provided for @settings_error_languageEmpty.
  ///
  /// In en, this message translates to:
  /// **'Could not find any languages. Please ensure that you\'re searching by IANA language subtag (ie: \"en\", \"ko\", etc.) or language name and try again.'**
  String get settings_error_languageEmpty;

  /// No description provided for @settings_error_getLanguage.
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch the current language. Using the default language.'**
  String get settings_error_getLanguage;

  /// No description provided for @settings_error_saveLanguage.
  ///
  /// In en, this message translates to:
  /// **'Failed to save language.'**
  String get settings_error_saveLanguage;

  /// No description provided for @settings_error_signOut.
  ///
  /// In en, this message translates to:
  /// **'Failed to sign out. Please try again.'**
  String get settings_error_signOut;

  /// No description provided for @theme_title.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme_title;

  /// No description provided for @theme_headerFonts.
  ///
  /// In en, this message translates to:
  /// **'Header Fonts'**
  String get theme_headerFonts;

  /// No description provided for @theme_bodyFonts.
  ///
  /// In en, this message translates to:
  /// **'Body Fonts'**
  String get theme_bodyFonts;

  /// No description provided for @theme_colorsTitle.
  ///
  /// In en, this message translates to:
  /// **'{colors, select, light{Light} dark{Dark} blue{Blue} green{Green} other{Unknown}}'**
  String theme_colorsTitle(String colors);

  /// No description provided for @theme_fontTitle.
  ///
  /// In en, this message translates to:
  /// **'{font, select, crimsonText{Crimson Text} poppins{Poppins} other{Unknown}}'**
  String theme_fontTitle(String font);

  /// No description provided for @feed_title.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get feed_title;

  /// No description provided for @recipes_title.
  ///
  /// In en, this message translates to:
  /// **'Recipes'**
  String get recipes_title;

  /// No description provided for @recipes_searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search recipes'**
  String get recipes_searchHint;

  /// No description provided for @recipes_loadError.
  ///
  /// In en, this message translates to:
  /// **'Sorry, we encountered an error loading your recipes. Please refresh the page or check back again later.'**
  String get recipes_loadError;

  /// No description provided for @recipes_loadErrorRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get recipes_loadErrorRefresh;

  /// No description provided for @recipes_loadEmpty.
  ///
  /// In en, this message translates to:
  /// **'Looks like you don’t have any recipes yet. Let’s get cooking!'**
  String get recipes_loadEmpty;

  /// No description provided for @recipes_loadEmptyCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get recipes_loadEmptyCreate;

  /// No description provided for @recipes_sortFilterHint.
  ///
  /// In en, this message translates to:
  /// **'Sort and filter'**
  String get recipes_sortFilterHint;

  /// No description provided for @recipes_sort_recentlyViewed.
  ///
  /// In en, this message translates to:
  /// **'Recently viewed'**
  String get recipes_sort_recentlyViewed;

  /// No description provided for @recipes_sort_rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get recipes_sort_rating;

  /// No description provided for @recipes_sort_quickest.
  ///
  /// In en, this message translates to:
  /// **'Quickest'**
  String get recipes_sort_quickest;

  /// No description provided for @recipes_sort_easiest.
  ///
  /// In en, this message translates to:
  /// **'Easiest'**
  String get recipes_sort_easiest;

  /// No description provided for @recipes_filter_timeMin.
  ///
  /// In en, this message translates to:
  /// **'Time > {time}m'**
  String recipes_filter_timeMin(int time);

  /// No description provided for @recipes_filter_timeMax.
  ///
  /// In en, this message translates to:
  /// **'Time < {time}m'**
  String recipes_filter_timeMax(int time);

  /// No description provided for @recipes_filter_ratingMin.
  ///
  /// In en, this message translates to:
  /// **'Rating > {rating}'**
  String recipes_filter_ratingMin(double rating);

  /// No description provided for @recipes_filter_servingsMin.
  ///
  /// In en, this message translates to:
  /// **'Servings > {servings}'**
  String recipes_filter_servingsMin(int servings);

  /// No description provided for @recipes_filter_servingsMax.
  ///
  /// In en, this message translates to:
  /// **'Servings < {servings}'**
  String recipes_filter_servingsMax(int servings);

  /// No description provided for @recipes_filter_difficultyEasy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get recipes_filter_difficultyEasy;

  /// No description provided for @recipes_filter_difficultyMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get recipes_filter_difficultyMedium;

  /// No description provided for @recipes_filter_difficultyHard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get recipes_filter_difficultyHard;

  /// No description provided for @profile_title.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile_title;
}

class _StringsDelegate extends LocalizationsDelegate<Strings> {
  const _StringsDelegate();

  @override
  Future<Strings> load(Locale locale) {
    return SynchronousFuture<Strings>(lookupStrings(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_StringsDelegate old) => false;
}

Strings lookupStrings(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return StringsEn();
    case 'ko':
      return StringsKo();
  }

  throw FlutterError(
    'Strings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
