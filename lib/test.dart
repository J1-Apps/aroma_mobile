import "package:aroma_mobile/app.dart";
import "package:aroma_mobile/presentation/util/environment/test_environment.dart";
import "package:flutter/material.dart";

void main() async {
  await TestEnvironment().configure();
  runApp(const AromaApp());
}
