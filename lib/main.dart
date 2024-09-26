import 'package:beclean_user/provider/user_provider.dart';
import 'package:beclean_user/screens/change_password_screen.dart';
import 'package:beclean_user/screens/login_screen.dart';
import 'package:beclean_user/screens/nav/home_nav.dart';
import 'package:beclean_user/screens/splash_screen_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreenOne(),
          routes: {
            '/changePassword': (context) => const ChangePasswordScreen(),
            '/home': (context) => HomeNav(),
            '/LoginScreen': (context) => const LoginScreen()
          },
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
        ));
    //   BlocProvider(
    //       create: (context) => RegisterBloc(),
    //       child:
    // }
  }
}
