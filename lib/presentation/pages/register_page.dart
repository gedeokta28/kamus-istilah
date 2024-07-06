import 'package:flutter/material.dart';
import 'package:kamus_istilah/presentation/pages/login_page.dart';
import 'package:kamus_istilah/presentation/pages/started_page.dart';
import 'package:kamus_istilah/presentation/widgets/custom_text_field.dart';
import 'package:kamus_istilah/presentation/widgets/rounded_button.dart';
import 'package:kamus_istilah/static/assets.dart';
import 'package:kamus_istilah/static/colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.2,
        centerTitle: true,
        title: Text(
          'Register',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: ListView(children: [
          Center(
            child: Image.asset(
              appLogo,
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
              child: Column(
            children: [
              CustomTextField(
                title: "Email",
                border: true,
                placeholder: "Masukkan Email",
                controller: emailController,
                inputType: TextInputType.emailAddress,
                fieldValidator: null,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: "Kata sandi",
                isSecure: true,
                refresh: true,
                placeholder: "Masukkan Password",
                controller: passwordController,
                inputType: TextInputType.visiblePassword,
                border: true,
                fieldValidator: null,
              ),
              SizedBox(
                height: 15,
              ),
              RoundedButton(title: "Daftar", event: () {}),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sudah punya akun?",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, StartedPage.routeName);
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: 50,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4, right: 15),
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ]),
      ),
    );
  }
}
