import 'package:go_router/go_router.dart';
import 'package:lol_app/presentation/pages/404/404_page.dart';
import 'package:lol_app/presentation/pages/detail/detail_page.dart';
import 'package:lol_app/presentation/pages/home/home_page.dart';
import 'package:lol_app/presentation/pages/splash/splash_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  errorBuilder: (context, state) => const Page404(),
  routes: [
    GoRoute(
      path: '/splash',
      name: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home-page',
      name: '/home-page',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/detail-page',
      name: '/detail-page',
      builder: (context, state) {
        return const DetailPage();
      },
    ),
  ],
);
