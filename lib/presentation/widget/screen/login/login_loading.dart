import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class LoginLoading extends StatelessWidget {
  const LoginLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: JLoadingIndicator());
  }
}
