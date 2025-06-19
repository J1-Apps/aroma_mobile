import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/domain/usecase/auth/create_user_email_usecase.dart";
import "package:aroma_mobile/presentation/bloc/login/register_event.dart";
import "package:aroma_mobile/presentation/bloc/login/register_state.dart";
import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final CreateUserEmailUsecase _createUserEmailUsecase;

  RegisterBloc({CreateUserEmailUsecase? createUserEmailUsecase})
    : _createUserEmailUsecase = createUserEmailUsecase ?? locator.get<CreateUserEmailUsecase>(),
      super(RegisterState()) {
    on<RegisterEventSignUpWithEmail>(_onSignUpWithEmail, transformer: restartable());
  }

  Future<void> _onSignUpWithEmail(RegisterEventSignUpWithEmail event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _createUserEmailUsecase(event.email, event.password);

    switch (result) {
      case Success():
        emit(state.copyWith(isLoading: false, error: null));
      case Failure():
        emit(state.copyWith(isLoading: false, error: result.error.errorCode));
    }
  }
}
