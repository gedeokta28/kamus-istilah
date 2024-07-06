import 'package:flutter/material.dart';
import 'package:kamus_istilah/presentation/pages/home_page.dart';
import 'package:kamus_istilah/presentation/pages/started_page.dart';
import 'package:kamus_istilah/static/assets.dart';
import 'package:kamus_istilah/utility/injection.dart';
import 'package:kamus_istilah/utility/session_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    final session = locator<Session>();

    Future.delayed(const Duration(seconds: 2), () async {
      if (session.isLoggedIn) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        Navigator.pushReplacementNamed(context, StartedPage.routeName);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white54,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset(
            appLogo,
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
