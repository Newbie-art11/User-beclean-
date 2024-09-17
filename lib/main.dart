import 'package:beclean_user/screens/login_screen.dart';
import 'package:beclean_user/screens/onboarding_screen_tree.dart';
import 'package:beclean_user/screens/onboarding_screen_two.dart';
import 'package:beclean_user/screens/register_screen.dart';
import 'package:beclean_user/screens/splash_screen_one.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());
final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return SplashScreenOne();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'OnBoardingTwo',
            builder: (BuildContext context, GoRouterState state) {
              return OnboardingScreenTwo();
            }),
        GoRoute(
            path: 'OnBoardingTree',
            builder: (BuildContext context, GoRouterState state) {
              return OnBoardingTree();
            }),
        GoRoute(
          path: 'LoginScreen',
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
            path: 'RegisterScreen',
            builder: (context, state) => RegisterScreen())
        // GoRouter(routes: routes)
      ])
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
    );
  }
}

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
