import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/presentation/bloc/login/login_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_bloc.dart";
import "package:aroma_mobile/presentation/bloc/router/router_bloc.dart";
import "package:aroma_mobile/presentation/screen/home/home_screen.dart";
import "package:aroma_mobile/presentation/screen/login/auth_listener.dart";
import "package:aroma_mobile/presentation/screen/login/login_screen.dart";
import "package:aroma_mobile/presentation/screen/login/register_screen.dart";
import "package:aroma_mobile/presentation/screen/login/reset_password_screen.dart";
import "package:aroma_mobile/presentation/screen/login/sign_in_screen.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

// This is a configuration file that doesn't need to be tested.
// coverage:ignore-file

const _loginPath = "/login";
const _signInPath = "signin";
const _signUpPath = "signup";
const _resetPasswordPath = "reset-password";

const _homePath = "/";

final routeGraph = GoRouteGraph(
  routes: [
    J1ShellNode(
      builder: (_, child) => LoginListener(child: child),
      redirect: (context) => context.read<RouterBloc>().state.auth is AuthEntitySignedIn ? _homePath : null,
      routes: [
        J1RouteNode(
          route: AromaRoute.login,
          builder: (_, _) => BlocProvider(
            create: (_) => LoginBloc(),
            child: const LoginScreen(),
          ),
          routes: [
            J1RouteNode(
              route: AromaRoute.signIn,
              builder: (_, _) => BlocProvider(
                create: (_) => SignInBloc(),
                child: const SignInScreen(),
              ),
            ),
            J1RouteNode(
              route: AromaRoute.signUp,
              builder: (_, _) => const RegisterScreen(),
            ),
            J1RouteNode(
              route: AromaRoute.resetPassword,
              builder: (_, _) => const ResetPasswordScreen(),
            ),
          ],
        ),
      ],
    ),
    J1ShellNode(
      builder: (_, child) => LogoutListener(child: child),
      redirect: (context) => context.read<RouterBloc>().state.auth is! AuthEntitySignedIn ? _loginPath : null,
      routes: [
        J1RouteNode(
          route: AromaRoute.home,
          builder: (_, _) => const HomeScreen(),
          routes: [],
        ),
      ],
    ),
  ],
);

abstract class AromaRoute {
  static final login = J1Route<EmptyRouteConfig>(
    parts: [PathSegment(_loginPath)],
    configParser: EmptyRouteConfig.parser,
  );

  static final signIn = J1Route<EmptyRouteConfig>(
    parts: [PathSegment(_loginPath), PathSegment(_signInPath)],
    configParser: EmptyRouteConfig.parser,
  );

  static final signUp = J1Route<EmptyRouteConfig>(
    parts: [PathSegment(_loginPath), PathSegment(_signUpPath)],
    configParser: EmptyRouteConfig.parser,
  );

  static final resetPassword = J1Route<EmptyRouteConfig>(
    parts: [PathSegment(_loginPath), PathSegment(_resetPasswordPath)],
    configParser: EmptyRouteConfig.parser,
  );

  static final home = J1Route<EmptyRouteConfig>(
    parts: [PathSegment(_homePath)],
    configParser: EmptyRouteConfig.parser,
  );
}
