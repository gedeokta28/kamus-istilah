import 'package:flutter/material.dart';
import 'package:kamus_istilah/data/models/istilah_response_model.dart';
import 'package:kamus_istilah/presentation/widgets/custom_search_bar.dart';
import 'package:kamus_istilah/static/colors.dart';

class DaftarIstilahPage extends StatefulWidget {
  final List<IstilahData> dataIstilah;

  static const routeName = '/daftar_istilah';
  const DaftarIstilahPage({Key? key, required this.dataIstilah})
      : super(key: key);

  @override
  State<DaftarIstilahPage> createState() => _DaftarIstilahPageState();
}

class _DaftarIstilahPageState extends State<DaftarIstilahPage> {
  List<IstilahData> _istilahList = [];
  List<IstilahData> _foundIstilah = [];
  @override
  initState() {
    _istilahList = widget.dataIstilah;
    _foundIstilah = _istilahList;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<IstilahData> results = [];
    if (enteredKeyword.isEmpty) {
      results = _istilahList;
    } else {
      results = _istilahList
          .where((data) => data.namaIstilah
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundIstilah = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.2,
        centerTitle: true,
        title: Text(
          'Daftar Istilah',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomSearchBar(
              hint: 'Cari Istilah..',
              enabled: true,
              onChanged: (value) => _runFilter(value),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundIstilah.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: _foundIstilah.length,
                      itemBuilder: (context, index) => InkWell(
                        key: ValueKey(_foundIstilah[index].idistilah),
                        onTap: () {
                          FocusScope.of(context).unfocus();
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Istilah:",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          _foundIstilah[index].namaIstilah,
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Deskripsi:",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          _foundIstilah[index].deskripsi,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.book,
                                color: Colors.grey,
                                size: 13,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                _foundIstilah[index].namaIstilah,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'Istilah tidak ditemukan',
                      style: TextStyle(fontSize: 13),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
