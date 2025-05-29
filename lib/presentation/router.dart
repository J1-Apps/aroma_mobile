import "package:aroma_mobile/presentation/home/home_screen.dart";
import "package:j1_core_base/j1_core_base.dart";

// This is a configuration file that doesn't need to be tested.
// coverage:ignore-file

const _homePath = "/";

final routeGraph = GoRouteGraph(
  routes: [J1RouteNode(route: AromaRoute.home, builder: (_, _) => const HomeScreen(), routes: [])],
);

abstract class AromaRoute {
  static const home = J1Route<EmptyRouteConfig>(parts: [PathSegment(_homePath)], configParser: EmptyRouteConfig.parser);
}
