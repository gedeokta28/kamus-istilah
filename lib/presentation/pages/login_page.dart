import 'package:flutter/material.dart';
import 'package:kamus_istilah/presentation/pages/home_page.dart';
import 'package:kamus_istilah/presentation/pages/register_page.dart';
import 'package:kamus_istilah/presentation/providers/login_provider.dart';
import 'package:kamus_istilah/presentation/state/login_state.dart';
import 'package:kamus_istilah/presentation/widgets/custom_simple_dialog.dart';
import 'package:kamus_istilah/presentation/widgets/custom_text_field.dart';
import 'package:kamus_istilah/presentation/widgets/rounded_button.dart';
import 'package:kamus_istilah/static/assets.dart';
import 'package:kamus_istilah/static/colors.dart';
import 'package:kamus_istilah/utility/helper.dart';
import 'package:kamus_istilah/utility/injection.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<LoginProvider>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0.2,
          centerTitle: true,
          title: Text(
            'Login',
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
            Consumer<LoginProvider>(builder: (context, provider, _) {
              return Form(
                  key: provider.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        title: "Username",
                        border: true,
                        placeholder: "Masukkan Username",
                        controller: provider.usernameController,
                        inputType: TextInputType.text,
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
                        controller: provider.passwordController,
                        inputType: TextInputType.visiblePassword,
                        border: true,
                        fieldValidator: null,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RoundedButton(
                          title: "Masuk",
                          event: () {
                            if (provider.usernameController.text.isNotEmpty &&
                                provider.passwordController.text.isNotEmpty) {
                              if (provider.formKey.currentState!.validate()) {
                                provider.doLoginApi().listen((state) async {
                                  switch (state.runtimeType) {
                                    case LoginFailure:
                                      showDialog(
                                        context: context,
                                        builder: (_) => CustomSimpleDialog(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          text:
                                              'Pastikan Username dan Password Benar !',
                                          color: Colors.black,
                                        ),
                                      );
                                      break;
                                    case LoginSuccess:
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              HomePage.routeName,
                                              (Route<dynamic> route) => false);
                                      showShortToast(message: "Login Sukses");
                                      break;
                                  }
                                });
                              }
                            } else {}
                          }),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Belum punya akun?",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, RegisterPage.routeName);
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: 50,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 15),
                                    child: Text(
                                      "Register",
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
                  ));
            })
          ]),
        ),
      ),
    );
  }
}
