import "dart:async";

import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_out_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/language_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/update_language_usecase.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_event.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_state.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final LanguageUsecase _languageUsecase;
  final UpdateLanguageUsecase _updateLanguageUsecase;
  final SignOutUsecase _signOutUsecase;

  StreamSubscription<String?>? _languageSubscription;

  SettingsBloc({
    LanguageUsecase? languageUsecase,
    UpdateLanguageUsecase? updateLanguageUsecase,
    SignOutUsecase? signOutUsecase,
  }) : _languageUsecase = languageUsecase ?? locator.get<LanguageUsecase>(),
       _updateLanguageUsecase = updateLanguageUsecase ?? locator.get<UpdateLanguageUsecase>(),
       _signOutUsecase = signOutUsecase ?? locator.get<SignOutUsecase>(),
       super(const SettingsState(language: null, isSigningOut: false, error: null)) {
    on<SettingsEventInit>(_onInit);
    on<SettingsEventUpdateLanguage>(_onUpdateLanguage);
    on<SettingsEventLanguageUpdated>(_onLanguageUpdated);
    on<SettingsEventSignOut>(_onSignOut);
  }

  Future<void> _onInit(SettingsEventInit event, Emitter<SettingsState> emit) async {
    await _languageSubscription?.cancel();
    _languageSubscription = _languageUsecase().listen(
      (language) => language != null ? add(SettingsEventLanguageUpdated(language)) : null,
    );
  }

  Future<void> _onUpdateLanguage(SettingsEventUpdateLanguage event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(error: null));
    final result = await _updateLanguageUsecase(event.language);

    switch (result) {
      case Success():
        emit(state.copyWith(error: null));
      case Failure():
        emit(state.copyWith(error: result.error.errorCode));
    }
  }

  Future<void> _onLanguageUpdated(SettingsEventLanguageUpdated event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(language: event.language));
  }

  Future<void> _onSignOut(SettingsEventSignOut event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(isSigningOut: true, error: null));
    final result = await _signOutUsecase();

    switch (result) {
      case Success():
        emit(state.copyWith(isSigningOut: false, error: null));
      case Failure():
        emit(state.copyWith(isSigningOut: false, error: result.error.errorCode));
    }
  }

  @override
  Future<void> close() {
    _languageSubscription?.cancel();
    return super.close();
  }
}
