import "dart:async";

import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/domain/usecase/auth/auth_usecase.dart";
import "package:aroma_mobile/presentation/bloc/router/router_event.dart";
import "package:aroma_mobile/presentation/bloc/router/router_state.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  final AuthUsecase _authUsecase;

  StreamSubscription<AuthEntity>? _authSubscription;

  RouterBloc({AuthUsecase? authUsecase})
    : _authUsecase = authUsecase ?? locator.get<AuthUsecase>(),
      super(const RouterState(auth: AuthEntitySignedOut())) {
    on<RouterEventInit>(_onInit);
    on<RouterEventAuthChanged>(_onAuthChanged);
  }

  Future<void> _onInit(RouterEventInit event, Emitter<RouterState> emit) async {
    _authSubscription?.cancel();
    _authSubscription = _authUsecase().listen((auth) {
      add(RouterEventAuthChanged(auth));
    });
  }

  Future<void> _onAuthChanged(RouterEventAuthChanged event, Emitter<RouterState> emit) async {
    emit(RouterState(auth: event.auth));
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
