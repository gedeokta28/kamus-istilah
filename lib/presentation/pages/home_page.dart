import 'package:flutter/material.dart';
import 'package:kamus_istilah/presentation/pages/istilah_page.dart';
import 'package:kamus_istilah/presentation/pages/started_page.dart';
import 'package:kamus_istilah/presentation/providers/home_provider.dart';
import 'package:kamus_istilah/presentation/state/istilah_state.dart';
import 'package:kamus_istilah/presentation/widgets/custom_dialog_logout.dart';
import 'package:kamus_istilah/static/assets.dart';
import 'package:kamus_istilah/static/colors.dart';
import 'package:kamus_istilah/utility/helper.dart';
import 'package:kamus_istilah/utility/injection.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<HomeProvider>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0.2,
          centerTitle: true,
          title: Text(
            'Beranda',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          actions: [
            InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => CustomLogoutDialog(
                      positiveAction: () async {
                        await sessionLogOut().then((_) => Navigator.of(context)
                            .pushNamedAndRemoveUntil(
                                StartedPage.routeName, (route) => false));
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(Icons.logout_outlined),
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer<HomeProvider>(builder: (context, provider, _) {
                    return InkWell(
                      onTap: () {
                        provider.getIstilahApi().listen((state) async {
                          switch (state.runtimeType) {
                            case IstilahFailure:
                              showShortToast(message: "Server Error");
                              break;
                            case IstilahSuccess:
                              final result = (state as IstilahSuccess).data;
                              Navigator.of(context).pushNamed(
                                  DaftarIstilahPage.routeName,
                                  arguments: result);
                              break;
                          }
                        });
                      },
                      child: Container(
                        width: 150,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: 48, // Image radius
                              backgroundImage: AssetImage(iconDaftarIstilah),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Daftar Istilah',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              width: double.infinity, // Set the width here
                              padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal:
                                      15), // Optional: Add padding if needed
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Panduan',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    'Aplikasi ini terdapat beberapa pilihan untuk melakukan action yang mempunyai fungsi masing-masing: ',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        child: Text(
                                          "1.",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(
                                        'Kamus Istilah',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Pada menu ini anda dapat melihat nama-nama dalam Istilah IT lengkap dengan deskripsi.',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        child: Text(
                                          "2.",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(
                                        'Panduan',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Pada menu ini anda dapat melihat panduan dalam menggunakan aplikasi ini.',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        child: Text(
                                          "3.",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(
                                        'Tentang',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Pada menu ini berisi informasi tentang pengembang aplikasi ini.',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 150,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor,

                            radius: 48, // Image radius
                            backgroundImage: AssetImage(iconPetunjuk),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Petunjuk',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16))),
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.4,
                          minChildSize: 0.2,
                          maxChildSize: 0.75,
                          expand: false,
                          builder: (_, controller) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nama:",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Nama Pengembang',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Alamat:",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Alamat Pengembang',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Tempat/Tgl. Lahir:",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Tgl lahir Pengembang',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Agama:",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Agama Pengembang',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 48, // Image radius
                            backgroundImage: AssetImage(iconTentang),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Tentang',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
