sealed class ResetPasswordEvent {
  const ResetPasswordEvent();
}

class ResetPasswordEventResetPassword extends ResetPasswordEvent {
  final String email;

  const ResetPasswordEventResetPassword({required this.email});
}
