import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_google_usecase.dart";
import "package:aroma_mobile/presentation/bloc/login/login_event.dart";
import "package:aroma_mobile/presentation/bloc/login/login_state.dart";
import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInGoogleUsecase _signInGoogleUsecase;

  LoginBloc({SignInGoogleUsecase? signInGoogleUsecase})
    : _signInGoogleUsecase = signInGoogleUsecase ?? locator.get<SignInGoogleUsecase>(),
      super(const LoginState()) {
    on<LoginEventSignInWithGoogle>(_onSignInWithGoogle, transformer: restartable());
  }

  Future<void> _onSignInWithGoogle(LoginEventSignInWithGoogle event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _signInGoogleUsecase();

    switch (result) {
      case Success():
        emit(state.copyWith(isLoading: false, error: null));
      case Failure():
        emit(state.copyWith(isLoading: false, error: result.error.errorCode));
    }
  }
}
