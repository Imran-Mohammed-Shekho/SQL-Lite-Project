import 'package:flutter/material.dart';
import 'package:testing/SignUpScreen.dart';
import 'package:testing/loginScreen.dart';
import 'package:testing/routes/routes.dart';
import 'package:testing/splashScreen.dart';
import 'package:testing/userHome.dart';

void main() {
  runApp(SQliteProject());
}

class SQliteProject extends StatelessWidget {
  const SQliteProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,

      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.signUp: (_) => const SignUpScreen(),
        AppRoutes.userHome: (_) => const UserHome(),
      },
    );
  }
}
