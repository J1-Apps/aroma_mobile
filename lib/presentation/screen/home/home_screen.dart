import "package:aroma_mobile/domain/usecase/auth/sign_out_usecase.dart";
import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Home"),
            TextButton(
              onPressed: () => locator.get<SignOutUsecase>().call(),
              child: const Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
