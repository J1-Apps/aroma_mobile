import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_email_usecase.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_event.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_state.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInEmailUsecase _signInEmailUsecase;

  SignInBloc({SignInEmailUsecase? signInEmailUsecase})
    : _signInEmailUsecase = signInEmailUsecase ?? locator.get<SignInEmailUsecase>(),
      super(const SignInState()) {
    on<SignInEventSignInWithEmail>(_onSignInWithEmail);
  }

  Future<void> _onSignInWithEmail(SignInEventSignInWithEmail event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _signInEmailUsecase(event.email, event.password);

    switch (result) {
      case Success():
        emit(state.copyWith(isLoading: false, error: null));
      case Failure():
        emit(state.copyWith(isLoading: false, error: result.error.errorCode));
    }
  }
}
