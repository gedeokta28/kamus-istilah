import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kamus_istilah/data/models/istilah_response_model.dart';
import 'package:kamus_istilah/presentation/widgets/custom_search_bar.dart';
import 'package:kamus_istilah/static/colors.dart';
import 'package:shimmer/shimmer.dart';

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
                              initialChildSize: 0.5,
                              minChildSize: 0.4,
                              maxChildSize: 0.75,
                              expand: false,
                              builder: (_, controller) => SingleChildScrollView(
                                controller: controller,
                                child: Column(
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
                                          Center(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        FullScreenImage(
                                                      imageUrl:
                                                          "https://kamus-istilah-it.my.id/uploads/${_foundIstilah[index].file}",
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://kamus-istilah-it.my.id/uploads/${_foundIstilah[index].file}", // Ganti dengan properti URL gambar Anda
                                                placeholder: (context, url) =>
                                                    Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  child: Container(
                                                    width:
                                                        100, // Sesuaikan ukuran placeholder
                                                    height:
                                                        100, // Sesuaikan ukuran placeholder
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                                width:
                                                    100, // Sesuaikan ukuran gambar
                                                height:
                                                    100, // Sesuaikan ukuran gambar
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
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
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 2.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "https://kamus-istilah-it.my.id/uploads/${_foundIstilah[index].file}", // Ganti dengan properti URL gambar Anda
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 30, // Sesuaikan ukuran placeholder
                                    height: 30, // Sesuaikan ukuran placeholder
                                    color: Colors.white,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                width: 30, // Sesuaikan ukuran gambar
                                height: 30, // Sesuaikan ukuran gambar
                              ),
                              const SizedBox(
                                width: 8,
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

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  FullScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
