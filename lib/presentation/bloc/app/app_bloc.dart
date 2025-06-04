import "dart:async";

import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/domain/usecase/auth/auth_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/language_usecase.dart";
import "package:aroma_mobile/presentation/bloc/app/app_event.dart";
import "package:aroma_mobile/presentation/bloc/app/app_state.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthUsecase _authUsecase;
  final LanguageUsecase _languageUsecase;

  StreamSubscription<AuthEntity>? _authSubscription;
  StreamSubscription<String?>? _languageSubscription;

  AppBloc({
    AuthUsecase? authUsecase,
    LanguageUsecase? languageUsecase,
  }) : _authUsecase = authUsecase ?? locator.get<AuthUsecase>(),
       _languageUsecase = languageUsecase ?? locator.get<LanguageUsecase>(),
       super(const AppState(auth: AuthEntitySignedOut(), language: null)) {
    on<AppEventInit>(_onInit);
    on<AppEventAuthChanged>(_onAuthChanged);
    on<AppEventLanguageChanged>(_onLanguageChanged);
  }

  Future<void> _onInit(AppEventInit event, Emitter<AppState> emit) async {
    await _authSubscription?.cancel();
    await _languageSubscription?.cancel();

    _authSubscription = _authUsecase().listen(
      (auth) => add(AppEventAuthChanged(auth)),
    );

    _languageSubscription = _languageUsecase().listen(
      (language) => add(AppEventLanguageChanged(language)),
    );
  }

  Future<void> _onAuthChanged(AppEventAuthChanged event, Emitter<AppState> emit) async {
    emit(state.copyWith(auth: event.auth));
  }

  Future<void> _onLanguageChanged(AppEventLanguageChanged event, Emitter<AppState> emit) async {
    emit(state.copyWith(language: event.language));
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    _languageSubscription?.cancel();
    return super.close();
  }
}
