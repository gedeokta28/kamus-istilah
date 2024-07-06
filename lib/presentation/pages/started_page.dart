import 'package:flutter/material.dart';
import 'package:kamus_istilah/presentation/pages/login_page.dart';
import 'package:kamus_istilah/presentation/widgets/rounded_button.dart';
import 'package:kamus_istilah/static/assets.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({super.key});
  static const routeName = '/started';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              appLogo,
              width: 250,
              height: 250,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Welcome To\nAplikasi Kamus Istilah IT',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: RoundedButton(
                title: "Login",
                event: () {
                  Navigator.pushNamed(context, LoginPage.routeName);
                }),
          )
        ],
      )),
    );
  }
}
