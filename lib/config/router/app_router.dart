import 'package:go_router/go_router.dart';

import '../../modules/character_view/presentation/pages/character_view_screen.dart';
import '../../modules/home/presentation/pages/home_screen.dart';
import '../../modules/splash/presentation/pages/Splash_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeScreen(),
  ),
 
  GoRoute(
      path: '/character',
      builder: (context, state) {
        final character = state.extra as Map;
        return CharacterViewScreen(
          character: character['character'],
        );
      }),
 
]);
