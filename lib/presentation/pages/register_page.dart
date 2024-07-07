import 'package:flutter/material.dart';
import 'package:kamus_istilah/presentation/pages/login_page.dart';
import 'package:kamus_istilah/presentation/pages/started_page.dart';
import 'package:kamus_istilah/presentation/providers/register_provider.dart';
import 'package:kamus_istilah/presentation/state/register_state.dart';
import 'package:kamus_istilah/presentation/widgets/custom_simple_dialog.dart';
import 'package:kamus_istilah/presentation/widgets/custom_text_field.dart';
import 'package:kamus_istilah/presentation/widgets/rounded_button.dart';
import 'package:kamus_istilah/static/assets.dart';
import 'package:kamus_istilah/static/colors.dart';
import 'package:kamus_istilah/utility/injection.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<RegisterProvider>(),
      child: Scaffold(
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
            Consumer<RegisterProvider>(builder: (context, provider, _) {
              return Form(
                  key: provider.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        title: "Nama Lengkap",
                        border: true,
                        placeholder: "Masukkan Nama Lengkap",
                        controller: provider.fullNameController,
                        inputType: TextInputType.text,
                        fieldValidator: null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                          title: "Daftar",
                          event: () {
                            if (provider.usernameController.text.isNotEmpty &&
                                provider.passwordController.text.isNotEmpty &&
                                provider.fullNameController.text.isNotEmpty) {
                              provider.doRegisterApi().listen((state) async {
                                switch (state.runtimeType) {
                                  case RegisterFailure:
                                    showDialog(
                                      context: context,
                                      builder: (_) => CustomSimpleDialog(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        text:
                                            'Username ini sudah dipakai. Coba username lain!',
                                        color: Colors.black,
                                      ),
                                    );
                                    break;
                                  case RegisterSuccess:
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (_) => CustomSimpleDialog(
                                        onTap: () {
                                          Navigator.of(locator<
                                                      GlobalKey<
                                                          NavigatorState>>()
                                                  .currentContext!)
                                              .pushNamedAndRemoveUntil(
                                                  StartedPage.routeName,
                                                  (Route<dynamic> route) =>
                                                      false);
                                          Navigator.pushNamed(
                                              locator<
                                                      GlobalKey<
                                                          NavigatorState>>()
                                                  .currentContext!,
                                              LoginPage.routeName);
                                        },
                                        text:
                                            'Pendaftaran Berhasil \n Silahkan Log in ',
                                        color: Colors.black,
                                      ),
                                    );
                                    break;
                                }
                              });
                            }
                          }),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Sudah punya akun?",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, StartedPage.routeName);
                                Navigator.pushNamed(
                                    context, LoginPage.routeName);
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: 50,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 15),
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
                  ));
            })
          ]),
        ),
      ),
    );
  }
}
