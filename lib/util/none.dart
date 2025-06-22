import "package:flutter/foundation.dart";

// TODO: Move to j1_core_base and test.
// coverage:ignore-file
@immutable
final class None {
  const None();

  @override
  String toString() => "None";

  @override
  bool operator ==(Object other) {
    return other is None;
  }

  @override
  int get hashCode => 0;
}
