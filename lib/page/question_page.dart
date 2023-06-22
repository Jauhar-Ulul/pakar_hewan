import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'result.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class Ciri {
  String gambarCiri;
  String soal;
  String kategoriCiri;
  Ciri(
      {required this.gambarCiri,
      required this.soal,
      required this.kategoriCiri});
}

class _QuestionPageState extends State<QuestionPage> {
  List<String> listKategori = ['Makanan', 'Hidup', 'berjalan', 'kulit'];
  List<Ciri> listCiri = [
    // M1
    Ciri(
        gambarCiri: 'assets/image/ciri/daging.svg',
        soal: 'Apakah hewan pemakan daging',
        kategoriCiri: 'Makanan'),
    // M2
    Ciri(
        gambarCiri: 'assets/image/ciri/salad.svg',
        soal: 'Apakah hewan pemakan Tumbuhan',
        kategoriCiri: 'Makanan'),
    // M3
    Ciri(
        gambarCiri: 'assets/image/ciri/salad.svg',
        soal: 'Apakah hewan pemakan Segala',
        kategoriCiri: 'Makanan'),
    // M4
    Ciri(
        gambarCiri: 'assets/image/ciri/salad.svg',
        soal: 'Apakah hewan Hidup di Darat',
        kategoriCiri: 'Hidup'),
    // M5
    Ciri(
        gambarCiri: 'assets/image/ciri/salad.svg',
        soal: 'Apakah hewan Hidup di Air',
        kategoriCiri: 'Hidup'),
    // M6
    Ciri(
        gambarCiri: 'assets/image/ciri/salad.svg',
        soal: 'Apakah hewan berjalan dengan kaki',
        kategoriCiri: 'berjalan'),
    // M7
    Ciri(
        gambarCiri: 'assets/image/ciri/salad.svg',
        soal: 'Apakah hewan berjalan dengan perut',
        kategoriCiri: 'berjalan'),
    // M8
    Ciri(
        gambarCiri: 'assets/image/ciri/salad.svg',
        soal: 'Apakah hewan berjalan dengan Sirip',
        kategoriCiri: 'berjalan'),
    // M9
    Ciri(
        gambarCiri: 'assets/image/ciri/salad.svg',
        soal: 'Apakah hewan bersisik',
        kategoriCiri: 'kulit'),
    // M10
    Ciri(
        gambarCiri: 'assets/image/ciri/salad.svg',
        soal: 'Apakah hewan berbulu',
        kategoriCiri: 'kulit'),
  ];

  List<String> hasilCiri = [];
  int noSoal = 0;
  int noKategori = 0;

  @override
  void initState() {
    noSoal = 0;
    noKategori = 0;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 41, 41, 41),
          ),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 2, 218, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: SvgPicture.asset(
                listCiri[noSoal].gambarCiri,
                width: 100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Container(
                child: Text(
                  listCiri[noSoal].soal,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                noSoal++;
                noKategori++;
                hasilCiri.add('M' + (noSoal).toString());
                print(hasilCiri);
                print(noSoal);
                print(noKategori);

                if (noSoal < listCiri.length &&
                    noKategori < listKategori.length) {
                  for (var i = 0; i < listCiri.length; i++) {
                    if (listCiri[noSoal].kategoriCiri.toString() !=
                        listKategori[noKategori].toString()) {
                      noSoal++;
                      i++;
                    } else {
                      setState(() {});
                      break;
                    }
                  }
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                        hasil: hasilCiri.toString(),
                      ),
                    ),
                  );
                }
              },
              child: Text(
                "Ya",
                style: TextStyle(fontSize: 30),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                noSoal++;
                if (noSoal < listCiri.length) {
                  setState(() {});
                } else {
                  noSoal = 0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(hasil: hasilCiri.toString()),
                    ),
                  );
                  print(noSoal);
                }
              },
              child: Text(
                "Tidak",
                style: TextStyle(fontSize: 30),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
