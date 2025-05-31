import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/presentation/bloc/router/router_bloc.dart";
import "package:aroma_mobile/presentation/screen/home/home_screen.dart";
import "package:aroma_mobile/presentation/screen/login/login_screen.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

// This is a configuration file that doesn't need to be tested.
// coverage:ignore-file

const _loginPath = "/login";
const _homePath = "/";

final routeGraph = GoRouteGraph(
  routes: [
    J1RouteNode(route: AromaRoute.login, builder: (_, _) => const LoginScreen(), routes: []),
    J1RouteNode(route: AromaRoute.home, builder: (_, _) => const HomeScreen(), routes: []),
  ],
);

abstract class AromaRoute {
  static final login = J1Route<EmptyRouteConfig>(
    parts: [PathSegment(_loginPath)],
    configParser: EmptyRouteConfig.parser,
    redirect: (context) => context.read<RouterBloc>().state.auth is AuthEntitySignedIn ? _homePath : null,
  );
  static final home = J1Route<EmptyRouteConfig>(
    parts: [PathSegment(_homePath)],
    configParser: EmptyRouteConfig.parser,
    redirect: (context) => context.read<RouterBloc>().state.auth is! AuthEntitySignedIn ? _loginPath : null,
  );
}
