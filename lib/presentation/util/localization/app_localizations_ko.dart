// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class StringsKo extends Strings {
  StringsKo([String locale = 'ko']) : super(locale);

  @override
  String get app_title => '아로마';

  @override
  String get login_loginButton => '로그인';

  @override
  String get login_registerButton => '회원가입';

  @override
  String get login_loginWith => '로그인';

  @override
  String get login_disclaimers => '로그인 시, 아로마의 ';

  @override
  String get login_termsOfUse => '이용약관';

  @override
  String get login_and => ' 및 ';

  @override
  String get login_privacyPolicy => '개인정보 처리방침';

  @override
  String get login_googleSignInFailed => '구글 로그인 실패, 다시 시도해주세요.';

  @override
  String get settings_title => '설정';

  @override
  String get settings_language => '언어';

  @override
  String get settings_theme => '테마';

  @override
  String get settings_logout => '로그아웃';

  @override
  String get settings_languageHint => '검색';

  @override
  String settings_languageLabel(String language) {
    String _temp0 = intl.Intl.selectLogic(
      language,
      {
        'en': '영어',
        'ko': '한국어',
        'other': '알 수 없음',
      },
    );
    return '$_temp0';
  }

  @override
  String get settings_error_languageEmpty =>
      '언어를 찾을 수 없습니다. IANA 언어 서브태그(예: \"en\", \"ko\" 등) 또는 언어 이름을 검색하고 다시 시도해주세요.';

  @override
  String get settings_error_getLanguage => '현재 언어를 가져오는 데 실패했습니다. 기본 언어를 사용합니다.';

  @override
  String get settings_error_saveLanguage => '언어를 저장하는 데 실패했습니다.';

  @override
  String get signIn_loginButton => '로그인';

  @override
  String get signIn_registerButton => '회원가입';

  @override
  String get signIn_emailLabel => '이메일';

  @override
  String get signIn_passwordLabel => '비밀번호';

  @override
  String get signIn_resetPasswordPrompt => '비밀번호를 잊으셨나요?';

  @override
  String get signIn_resetPasswordCta => '여기에서 재설정';

  @override
  String get signIn_emailSignInFailed => '이메일로 로그인 실패, 다시 시도해주세요.';

  @override
  String get register_emailLabel => '이메일';

  @override
  String get register_passwordLabel => '비밀번호';

  @override
  String get register_confirmPasswordLabel => '비밀번호 확인';

  @override
  String get register_registerButton => '회원가입';

  @override
  String get register_passwordMismatch => '비밀번호가 일치하지 않습니다.';

  @override
  String get register_emailSignUpFailed => '회원가입 실패, 다시 시도해주세요.';

  @override
  String get register_signInPrompt => '이미 계정이 있습니까?';

  @override
  String get register_signInCta => '로그인';

  @override
  String get resetPassword_emailLabel => '이메일';

  @override
  String get resetPassword_resetPassword => '비밀번호 재설정';

  @override
  String get resetPassword_signInPrompt => '비밀번호를 기억하셨나요?';

  @override
  String get resetPassword_signInCta => '로그인';

  @override
  String get resetPassword_resetPasswordSuccess => '비밀번호 재설정 이메일이 전송되었습니다. 이메일을 확인해주세요.';

  @override
  String get resetPassword_sendPasswordResetEmailFailed => '비밀번호 재설정 이메일 전송 실패, 다시 시도해주세요.';
}
