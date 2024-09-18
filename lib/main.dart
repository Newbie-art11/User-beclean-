import 'package:beclean_user/screens/login_screen.dart';
import 'package:beclean_user/screens/nav/home_nav.dart';
import 'package:beclean_user/screens/onboarding_screen_tree.dart';
import 'package:beclean_user/screens/register_screen.dart';
import 'package:beclean_user/screens/splash_screen_one.dart';
import 'package:beclean_user/services/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            builder: (context, state) => RegisterScreen()),
        GoRoute(path: "HomeNav", builder: (context, state) => HomeNav())
        // GoRouter(routes: routes)
      ])
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreenOne(),
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
        ));
  }
}
