sealed class SignInEvent {
  const SignInEvent();
}

class SignInEventSignInWithEmail extends SignInEvent {
  final String email;
  final String password;

  const SignInEventSignInWithEmail({
    required this.email,
    required this.password,
  });
}
