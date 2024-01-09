import 'package:android_tv_app/pages/informasiwifiScreen.dart';
import 'package:android_tv_app/pages/pelayanankamarScreen.dart';
import "package:go_router/go_router.dart";
import '../../pages/splashScreen.dart';
import '../../pages/homeScreen.dart';

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
      GoRoute(
        path: '/pelayanankamar',
        builder: (context, state) => const PelayanankamarScreen(),
      ),
      GoRoute(
        path: '/informasiwifi',
        builder: (context, state) => const InformasiwifiScreen(),
      ),
      // GoRoute(
      //   path: '/login',
      //   builder: (context, state) => const LoginScreen(),
      // ),

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
