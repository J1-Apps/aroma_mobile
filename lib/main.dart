import "package:aroma_mobile/app.dart";
import "package:aroma_mobile/presentation/util/environment/prod_environment.dart";
import "package:flutter/material.dart";

void main() async {
  await ProdEnvironment().configure();
  runApp(const AromaApp());
}
