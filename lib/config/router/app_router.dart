import 'package:go_router/go_router.dart';
import 'package:podtimer/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: "/splash",
      name: SplashScreen.name,
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: "/login",
      name: LoginScreen.name,
      builder: (_, __) => const LoginScreen(),
    ),
    GoRoute(
      path: "/home/:page",
      name: HomeScreen.name,
      builder: (context, state) {
        final index = int.parse(state.pathParameters['page'] ?? "0");
        return HomeScreen(index: index);
      },
      // add other routes so they are its children and they can arrow back to it
      routes: const [],
    ),
  ],
);
