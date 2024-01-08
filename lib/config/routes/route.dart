import "package:go_router/go_router.dart";


class RouterX {
  var router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      // GoRoute(
      //   path: '/search',
      //   builder: (context, state) => const SearchScreen(),
      // ),
      // GoRoute(
      //     path: '/newsview',
      //     builder: (context, state) {
      //       final String extraString =
      //           GoRouterState.of(context).extra! as String;
      //       return NewsViewScreen(link: extraString);
      //     }),
    ],
  );
}