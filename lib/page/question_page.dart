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
  List<Ciri> listCiri = [
    Ciri(
        gambarCiri: 'assets/image/ciri/daging.svg',
        soal: 'Apakah hewan pemakan daging',
        kategoriCiri: 'Makanan'),
    Ciri(
        gambarCiri: 'assets/image/ciri/salad.svg',
        soal: 'Apakah hewan pemakan Tumbuhan',
        kategoriCiri: 'Makanan')
  ];

  List<String> hasilCiri = [];
  int noSoal = 0;

  @override
  void initState() {
    noSoal = 0;
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
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Text(
                listCiri[noSoal].soal,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                noSoal++;
                hasilCiri.add('M' + (noSoal).toString());
                print(noSoal);
                print(hasilCiri);
                if (noSoal < listCiri.length) {
                  setState(() {});
                } else {
                  noSoal = 0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                        hasil: hasilCiri,
                      ),
                    ),
                  );
                  print(noSoal);
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
                      builder: (context) => Result(hasil: hasilCiri),
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
