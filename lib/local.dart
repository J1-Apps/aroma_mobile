import "package:aroma_mobile/app.dart";
import "package:aroma_mobile/environment/local_environment.dart";
import "package:flutter/material.dart";

void main() async {
  await LocalEnvironment().configure();
  runApp(const AromaApp());
}
