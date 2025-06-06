import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/presentation/bloc/app/app_bloc.dart";
import "package:aroma_mobile/presentation/bloc/app/app_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class LoginListener extends StatelessWidget {
  final Widget child;

  const LoginListener({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.auth is AuthEntitySignedIn) {
          context.navigate(AromaRoute.recipes, const EmptyRouteConfig());
        }
      },
      child: child,
    );
  }
}

class LogoutListener extends StatelessWidget {
  final Widget child;

  const LogoutListener({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.auth is! AuthEntitySignedIn) {
          context.navigate(AromaRoute.login, const EmptyRouteConfig());
        }
      },
      child: child,
    );
  }
}
