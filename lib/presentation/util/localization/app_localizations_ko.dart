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
  String get settings_error_signOut => '로그아웃 실패, 다시 시도해주세요.';

  @override
  String get theme_title => '테마';

  @override
  String get theme_headerFonts => '헤더 폰트';

  @override
  String get theme_bodyFonts => '바디 폰트';

  @override
  String theme_colorsTitle(String colors) {
    String _temp0 = intl.Intl.selectLogic(
      colors,
      {
        'light': '라이트',
        'dark': '다크',
        'blue': '블루',
        'other': '알 수 없음',
      },
    );
    return '$_temp0';
  }

  @override
  String theme_fontTitle(String font) {
    String _temp0 = intl.Intl.selectLogic(
      font,
      {
        'crimsonText': '크리미언 텍스트',
        'poppins': '팝핀스',
        'other': '알 수 없음',
      },
    );
    return '$_temp0';
  }

  @override
  String get feed_title => '피드';

  @override
  String get recipes_title => '레시피';

  @override
  String get recipes_searchHint => '레시피 검색';

  @override
  String get recipes_loadError => '레시피를 불러오는 중 오류가 발생했습니다. 페이지를 새로고침하거나 나중에 다시 시도해주세요.';

  @override
  String get recipes_loadErrorRefresh => '새로고침';

  @override
  String get recipes_loadEmpty => '레시피가 없습니다. 요리를 시작해보세요!';

  @override
  String get recipes_loadEmptyCreate => '만들기';

  @override
  String get recipes_sortFilterHint => '정렬 및 필터';

  @override
  String get recipes_sort_recentlyViewed => '최근 본 레시피';

  @override
  String get recipes_sort_rating => '평점';

  @override
  String get recipes_sort_quickest => '빠른 조리';

  @override
  String get recipes_sort_easiest => '쉬운 조리';

  @override
  String recipes_filter_timeMin(int time) {
    return '시간 > $time분';
  }

  @override
  String recipes_filter_timeMax(int time) {
    return '시간 < $time분';
  }

  @override
  String recipes_filter_ratingMin(double rating) {
    return '평점 > $rating';
  }

  @override
  String recipes_filter_servingsMin(int servings) {
    return '인분 > $servings';
  }

  @override
  String recipes_filter_servingsMax(int servings) {
    return '인분 < $servings';
  }

  @override
  String get recipes_filter_difficultyEasy => '쉬움';

  @override
  String get recipes_filter_difficultyMedium => '보통';

  @override
  String get recipes_filter_difficultyHard => '어려움';

  @override
  String get profile_title => '프로필';
}
