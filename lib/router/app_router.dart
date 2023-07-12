
import 'package:go_router/go_router.dart';

import '../screens/screen.dart';

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
    }

  ),
  // GoRoute(
  //     path: '/details',
  //     builder: (context, state) {
  //       final details = state.extra as Map;
  //       return BlocProvider(
  //         create: (context) => DetailsCocktailBloc(details['id'] as int),
  //         child: DetailsCocktailScreen(
  //           id: details['id'],
  //         ),
  //       );
  //     }),
]);
