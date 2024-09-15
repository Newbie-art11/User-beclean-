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
  MyApp({super.key});

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

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
