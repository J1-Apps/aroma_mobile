import "package:aroma_mobile/presentation/screen/login/login_scaffold.dart";
import "package:flutter/material.dart";

class ResetPasswordScreen extends StatelessWidget {
  final String initialEmail;

  const ResetPasswordScreen({
    this.initialEmail = "",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LoginScaffold(child: Center(child: Text("Reset Password")));
  }
}
