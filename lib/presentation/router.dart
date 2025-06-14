import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/presentation/bloc/app/app_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/login_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/register_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_bloc.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_bloc.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_event.dart";
import "package:aroma_mobile/presentation/widget/screen/home/feed/feed_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/home/home_navigation.dart";
import "package:aroma_mobile/presentation/widget/screen/home/profile/profile_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/login/auth_listener.dart";
import "package:aroma_mobile/presentation/widget/screen/login/login_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/login/register_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/login/reset_password_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/login/sign_in_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/settings/settings_screen.dart";
import "package:aroma_mobile/presentation/widget/screen/settings/theme_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:j1_core_base/j1_core_base.dart" as j1;

// This is a configuration file that doesn't need to be tested.
// coverage:ignore-file

final _rootKey = GlobalKey<NavigatorState>(debugLabel: "root");
final _loginKey = GlobalKey<NavigatorState>(debugLabel: "login");
final _homeKey = GlobalKey<NavigatorState>(debugLabel: "home");
final _feedKey = GlobalKey<NavigatorState>(debugLabel: "feed");
final _recipesKey = GlobalKey<NavigatorState>(debugLabel: "recipes");
final _profileKey = GlobalKey<NavigatorState>(debugLabel: "profile");

const _loginPath = "/login";
const _signInPath = "signin";
const _signUpPath = "signup";
const _resetPasswordPath = "reset-password";

const _settingsPath = "/settings";
const _themePath = "theme";

const _feedPath = "/feed";
const _recipesPath = "/recipes";
const _profilePath = "/profile";

const _rootRestorationScopeId = "root";
const _loginRestorationScopeId = "login";
const _homeRestorationScopeId = "home";
const _navShellRestorationScopeId = "nav_shell";
const _feedBranchRestorationScopeId = "feed_branch";
const _recipesBranchRestorationScopeId = "recipes_branch";
const _profileBranchRestorationScopeId = "profile_branch";

final routeConfig = GoRouter(
  navigatorKey: _rootKey,
  restorationScopeId: _rootRestorationScopeId,
  initialLocation: AromaRoute.recipes.build(const j1.EmptyRouteConfig()),
  redirectLimit: 20,
  routes: [
    ShellRoute(
      navigatorKey: _loginKey,
      restorationScopeId: _loginRestorationScopeId,
      builder: (_, state, child) => LoginListener(child: child),
      redirect: (context, _) => context.read<AppBloc>().state.auth is AuthEntitySignedIn
          ? AromaRoute.recipes.build(const j1.EmptyRouteConfig())
          : null,
      routes: [
        GoRoute(
          path: AromaRoute.login.relativePath,
          builder: (_, _) => BlocProvider(
            create: (_) => LoginBloc(),
            child: const LoginScreen(),
          ),
          routes: [
            GoRoute(
              path: AromaRoute.signIn.relativePath,
              builder: (_, state) => BlocProvider(
                create: (_) => SignInBloc(),
                child: SignInScreen(
                  initialEmail: state.uri.queryParameters["email"] ?? "",
                  initialPassword: state.uri.queryParameters["password"] ?? "",
                ),
              ),
              routes: [
                GoRoute(
                  path: AromaRoute.resetPassword.relativePath,
                  builder: (_, state) => BlocProvider(
                    create: (_) => ResetPasswordBloc(),
                    child: ResetPasswordScreen(
                      initialEmail: state.uri.queryParameters["email"] ?? "",
                    ),
                  ),
                ),
              ],
            ),
            GoRoute(
              path: AromaRoute.signUp.relativePath,
              builder: (_, state) => BlocProvider(
                create: (_) => RegisterBloc(),
                child: RegisterScreen(
                  initialEmail: state.uri.queryParameters["email"] ?? "",
                  initialPassword: state.uri.queryParameters["password"] ?? "",
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _homeKey,
      restorationScopeId: _homeRestorationScopeId,
      builder: (_, state, child) => LogoutListener(child: child),
      redirect: (context, _) => context.read<AppBloc>().state.auth is! AuthEntitySignedIn
          ? AromaRoute.login.build(const j1.EmptyRouteConfig())
          : null,
      routes: [
        StatefulShellRoute.indexedStack(
          restorationScopeId: _navShellRestorationScopeId,
          builder: (_, _, shell) => HomeNavigation(
            currentIndex: shell.currentIndex,
            updateIndex: (index) => shell.goBranch(index, initialLocation: index == shell.currentIndex),
            body: shell,
          ),
          branches: [
            StatefulShellBranch(
              navigatorKey: _feedKey,
              restorationScopeId: _feedBranchRestorationScopeId,
              routes: [
                GoRoute(
                  path: AromaRoute.feed.relativePath,
                  builder: (_, _) => const FeedScreen(),
                  routes: [],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _recipesKey,
              restorationScopeId: _recipesBranchRestorationScopeId,
              routes: [
                GoRoute(
                  path: AromaRoute.recipes.relativePath,
                  builder: (_, _) => const RecipesScreen(),
                  routes: [],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _profileKey,
              restorationScopeId: _profileBranchRestorationScopeId,
              routes: [
                GoRoute(
                  path: AromaRoute.profile.relativePath,
                  builder: (_, _) => const ProfileScreen(),
                  routes: [],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          parentNavigatorKey: _homeKey,
          path: AromaRoute.settings.relativePath,
          builder: (_, _) => BlocProvider(
            create: (_) => SettingsBloc()..add(const SettingsEventInit()),
            child: const SettingsScreen(),
          ),
          routes: [
            GoRoute(
              path: AromaRoute.theme.relativePath,
              builder: (_, _) => const ThemeScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

abstract class AromaRoute {
  static final login = j1.J1Route<j1.EmptyRouteConfig>(
    parts: [j1.PathSegment(_loginPath)],
    configParser: j1.EmptyRouteConfig.parser,
  );

  static final signIn = j1.J1Route<EmailPasswordRouteConfig>(
    parts: [j1.PathSegment(_loginPath), j1.PathSegment(_signInPath)],
    configParser: EmailPasswordRouteConfig.parser,
  );

  static final signUp = j1.J1Route<EmailPasswordRouteConfig>(
    parts: [j1.PathSegment(_loginPath), j1.PathSegment(_signUpPath)],
    configParser: EmailPasswordRouteConfig.parser,
  );

  static final resetPassword = j1.J1Route<EmailRouteConfig>(
    parts: [j1.PathSegment(_loginPath), j1.PathSegment(_signInPath), j1.PathSegment(_resetPasswordPath)],
    configParser: EmailRouteConfig.parser,
  );

  static final settings = j1.J1Route<j1.EmptyRouteConfig>(
    parts: [j1.PathSegment(_settingsPath)],
    configParser: j1.EmptyRouteConfig.parser,
  );

  static final theme = j1.J1Route<j1.EmptyRouteConfig>(
    parts: [j1.PathSegment(_settingsPath), j1.PathSegment(_themePath)],
    configParser: j1.EmptyRouteConfig.parser,
  );

  static final feed = j1.J1Route<j1.EmptyRouteConfig>(
    parts: [j1.PathSegment(_feedPath)],
    configParser: j1.EmptyRouteConfig.parser,
  );

  static final recipes = j1.J1Route<j1.EmptyRouteConfig>(
    parts: [j1.PathSegment(_recipesPath)],
    configParser: j1.EmptyRouteConfig.parser,
  );

  static final profile = j1.J1Route<j1.EmptyRouteConfig>(
    parts: [j1.PathSegment(_profilePath)],
    configParser: j1.EmptyRouteConfig.parser,
  );
}

class EmailPasswordRouteConfig extends j1.RouteConfig {
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

class EmailRouteConfig extends j1.RouteConfig {
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
