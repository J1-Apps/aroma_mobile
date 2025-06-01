import "package:aroma_mobile/presentation/screen/login/login_scaffold.dart";
import "package:flutter/material.dart";

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScaffold(child: Center(child: Text("Sign In")));
  }
}
