import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/domain/usecase/auth/reset_password_usecase.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_event.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_state.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordUsecase _resetPasswordUsecase;

  ResetPasswordBloc({ResetPasswordUsecase? resetPasswordUsecase})
    : _resetPasswordUsecase = resetPasswordUsecase ?? locator.get<ResetPasswordUsecase>(),
      super(const ResetPasswordState()) {
    on<ResetPasswordEventResetPassword>(_onResetPassword);
  }

  Future<void> _onResetPassword(ResetPasswordEventResetPassword event, Emitter<ResetPasswordState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _resetPasswordUsecase(event.email);

    switch (result) {
      case Success():
        emit(state.copyWith(isLoading: false, error: null));
      case Failure():
        emit(state.copyWith(isLoading: false, error: result.error.errorCode));
    }
  }
}
