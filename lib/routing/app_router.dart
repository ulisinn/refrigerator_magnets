import 'package:go_router/go_router.dart';
import 'package:magnets/features/screens/authenticated_landing_screen.dart';
import 'package:magnets/features/screens/create_account_screen.dart';
import 'package:magnets/features/screens/login_screen.dart';
import 'package:magnets/features/screens/logout.dart';
import 'package:magnets/features/screens/network_client_screen.dart';
import 'package:magnets/features/screens/splash_screen.dart';

enum AppRoute {
  home('/'),
  createAccount('/createAccount'),
  login('/login'),
  logout('/logout'),
  networkClient('/networkClient'),
  landing('/landing');

  const AppRoute(this.name);

  final String name;

  @override
  String toString() => name;
}

final routerConfig = GoRouter(
    initialLocation: '/landing',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/networkClient',
        name: AppRoute.networkClient.name,
        builder: (context, state) => const NetWorkClientScreen(),
      ),
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/createAccount',
        name: AppRoute.createAccount.name,
        builder: (context, state) => const CreateAccountScreen(),
      ),
      GoRoute(
        path: '/logout',
        name: AppRoute.logout.name,
        builder: (context, state) => const LogOutScreen(),
      ),
      GoRoute(
        path: '/landing',
        name: AppRoute.landing.name,
        builder: (context, state) => const LandingScreen(),
      ),
    ]);
