import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/presentation/bloc/app/app_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/login_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/register_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_bloc.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_bloc.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_event.dart";
import "package:aroma_mobile/presentation/widget/screen/home/home_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/login/auth_listener.dart";
import "package:aroma_mobile/presentation/widget/screen/login/login_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/login/register_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/login/reset_password_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/login/sign_in_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/settings/settings_screen.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

// This is a configuration file that doesn't need to be tested.
// coverage:ignore-file

const _loginPath = "/login";
const _signInPath = "signin";
const _signUpPath = "signup";
const _resetPasswordPath = "reset-password";

const _homePath = "/";
const _settingsPath = "settings";

final routeGraph = GoRouteGraph(
  routes: [
    J1ShellNode(
      builder: (_, child) => LoginListener(child: child),
      redirect: (context) => context.read<AppBloc>().state.auth is AuthEntitySignedIn ? _homePath : null,
      routes: [
        J1RouteNode(
          route: AromaRoute.login,
          builder: (_, _) => BlocProvider(
            create: (_) => LoginBloc(),
            child: const LoginScreen(),
          ),
          routes: [
            J1RouteNode<EmailPasswordRouteConfig>(
              route: AromaRoute.signIn,
              builder: (_, config) => BlocProvider(
                create: (_) => SignInBloc(),
                child: SignInScreen(
                  initialEmail: config.email,
                  initialPassword: config.password,
                ),
              ),
              routes: [
                J1RouteNode<EmailRouteConfig>(
                  route: AromaRoute.resetPassword,
                  builder: (_, config) => BlocProvider(
                    create: (_) => ResetPasswordBloc(),
                    child: ResetPasswordScreen(
                      initialEmail: config.email,
                    ),
                  ),
                ),
              ],
            ),
            J1RouteNode<EmailPasswordRouteConfig>(
              route: AromaRoute.signUp,
              builder: (_, config) => BlocProvider(
                create: (_) => RegisterBloc(),
                child: RegisterScreen(
                  initialEmail: config.email,
                  initialPassword: config.password,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    J1ShellNode(
      builder: (_, child) => LogoutListener(child: child),
      redirect: (context) => context.read<AppBloc>().state.auth is! AuthEntitySignedIn ? _loginPath : null,
      routes: [
        J1RouteNode(
          route: AromaRoute.home,
          builder: (_, _) => const HomeScreen(),
          routes: [
            J1RouteNode(
              route: AromaRoute.settings,
              builder: (_, _) => BlocProvider(
                create: (_) => SettingsBloc()..add(const SettingsEventInit()),
                child: const SettingsScreen(),
              ),
            ),
          ],
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

  static final signIn = J1Route<EmailPasswordRouteConfig>(
    parts: [PathSegment(_loginPath), PathSegment(_signInPath)],
    configParser: EmailPasswordRouteConfig.parser,
  );

  static final signUp = J1Route<EmailPasswordRouteConfig>(
    parts: [PathSegment(_loginPath), PathSegment(_signUpPath)],
    configParser: EmailPasswordRouteConfig.parser,
  );

  static final resetPassword = J1Route<EmailRouteConfig>(
    parts: [PathSegment(_loginPath), PathSegment(_signInPath), PathSegment(_resetPasswordPath)],
    configParser: EmailRouteConfig.parser,
  );

  static final home = J1Route<EmptyRouteConfig>(
    parts: [PathSegment(_homePath)],
    configParser: EmptyRouteConfig.parser,
  );

  static final settings = J1Route<EmptyRouteConfig>(
    parts: [PathSegment(_homePath), PathSegment(_settingsPath)],
    configParser: EmptyRouteConfig.parser,
  );
}

class EmailPasswordRouteConfig extends RouteConfig {
  final String email;
  final String password;

  @override
  Map<String, Object> get pathParams => const {};

  @override
  Map<String, Object?> get queryParams => {"email": email, "password": password};

  const EmailPasswordRouteConfig({this.email = "", this.password = ""});

  static EmailPasswordRouteConfig parser({
    required Map<String, String> pathParams,
    required Map<String, String> queryParams,
  }) {
    return EmailPasswordRouteConfig(
      email: queryParams["email"] ?? "",
      password: queryParams["password"] ?? "",
    );
  }
}

class EmailRouteConfig extends RouteConfig {
  final String email;

  @override
  Map<String, Object> get pathParams => const {};

  @override
  Map<String, Object?> get queryParams => {"email": email};

  const EmailRouteConfig({this.email = ""});

  static EmailRouteConfig parser({
    required Map<String, String> pathParams,
    required Map<String, String> queryParams,
  }) {
    return EmailRouteConfig(email: queryParams["email"] ?? "");
  }
}
