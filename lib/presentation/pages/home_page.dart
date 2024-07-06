import 'package:flutter/material.dart';
import 'package:kamus_istilah/static/assets.dart';
import 'package:kamus_istilah/static/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.2,
        centerTitle: true,
        title: Text(
          'Beranda',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                Container(
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
                Container(
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
