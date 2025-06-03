import "package:aroma_mobile/domain/entity/auth_entity.dart";

sealed class RouterEvent {
  const RouterEvent();
}

class RouterEventInit extends RouterEvent {
  const RouterEventInit();
}

class RouterEventAuthChanged extends RouterEvent {
  final AuthEntity auth;

  const RouterEventAuthChanged(this.auth);
}
