import "package:flutter/material.dart";
import "package:vector_graphics/vector_graphics.dart";

class LoginScaffold extends StatelessWidget {
  final Widget child;

  const LoginScaffold({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(child: _LoginHeader()),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    return VectorGraphic(
      loader: AssetBytesLoader("assets/vector/logo/logo.svg"),
      fit: BoxFit.fitWidth,
    );
  }
}
