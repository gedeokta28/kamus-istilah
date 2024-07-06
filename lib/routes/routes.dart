import 'package:flutter/material.dart';
import 'package:kamus_istilah/presentation/pages/home_page.dart';
import 'package:kamus_istilah/presentation/pages/login_page.dart';
import 'package:kamus_istilah/presentation/pages/register_page.dart';
import 'package:kamus_istilah/presentation/pages/splash_page.dart';
import 'package:kamus_istilah/presentation/pages/started_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(builder: (_) => const SplashPage());
    case LoginPage.routeName:
      return MaterialPageRoute(builder: (_) => const LoginPage());
    case StartedPage.routeName:
      return MaterialPageRoute(builder: (_) => const StartedPage());
    case RegisterPage.routeName:
      return MaterialPageRoute(builder: (_) => const RegisterPage());
    case HomePage.routeName:
      return MaterialPageRoute(builder: (_) => const HomePage());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
