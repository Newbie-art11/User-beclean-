import 'package:beclean_user/provider/account_provider.dart';
import 'package:beclean_user/provider/mutation_provider/mutation_provider.dart';
import 'package:beclean_user/provider/product_provider/product_provider.dart';
import 'package:beclean_user/provider/user_provider.dart';
import 'package:beclean_user/screens/change_password_screen.dart';
import 'package:beclean_user/screens/login_screen.dart';
import 'package:beclean_user/screens/nav/home_nav.dart';
import 'package:beclean_user/screens/register_screen.dart';
import 'package:beclean_user/screens/splash_screen_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider user = UserProvider();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) =>
                AccountProvider()..fetchProfile(user.getToken().toString()),
          ),
          ChangeNotifierProvider(
            create: (context) => ProductProvider(),
          ),
          ChangeNotifierProvider(create: (context) => MutationProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreenOne(),
          routes: {
            '/changePassword': (context) => const ChangePasswordScreen(),
            '/home': (context) => HomeNav(),
            '/LoginScreen': (context) => const LoginScreen(),
            '/RegisterScreen': (context) => RegisterScreen()
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
