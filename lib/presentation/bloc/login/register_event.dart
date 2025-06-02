sealed class RegisterEvent {
  const RegisterEvent();
}

class RegisterEventSignUpWithEmail extends RegisterEvent {
  final String email;
  final String password;

  const RegisterEventSignUpWithEmail({required this.email, required this.password});
}
