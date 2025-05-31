import "dart:async";

Future<void> awaitMs(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}
