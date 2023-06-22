import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_page.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class Result extends StatefulWidget {
  final String hasil;
  Result({super.key, required this.hasil});

  @override
  State<Result> createState() => _Result(hasil: hasil);
}

class Hewan {
  String gambarHewan;
  String namaHewan;
  String rumus;
  Hewan(
      {required this.gambarHewan,
      required this.namaHewan,
      required this.rumus});
}

class _Result extends State<Result> {
  final String hasil;
  bool status = false;
  _Result({required this.hasil});

  List<Hewan> rumusHewan = [
    Hewan(
        gambarHewan: 'assets/image/hewan png/hewan svg/Ular.svg',
        namaHewan: 'Ular',
        rumus: '[M1, M4, M7, M9]'),
    Hewan(
        gambarHewan: 'assets/image/hewan png/hewan svg/Hiu.svg',
        namaHewan: 'Hiu',
        rumus: '[M1, M5, M8, M9]'),
    Hewan(
        gambarHewan: 'assets/image/hewan png/hewan svg/Kambing.svg',
        namaHewan: 'Kambing',
        rumus: '[M2, M4, M6, M10]'),
    Hewan(
        gambarHewan: 'assets/image/hewan png/hewan svg/Udang.svg',
        namaHewan: 'Udang',
        rumus: '[M2, M5, M8, M9]'),
  ];
  List<Hewan> HasilHewan = [];

  bool isPlaying = false;
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    print(hasil);

    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < rumusHewan.length; i++) {
      if (hasil == rumusHewan[i].rumus.toString()) {
        HasilHewan.add(Hewan(
            gambarHewan: rumusHewan[i].gambarHewan,
            namaHewan: rumusHewan[i].namaHewan,
            rumus: rumusHewan[i].rumus));
        status = true;
        break;
      } else {
        status = false;
      }
    }

    if (status == true) {
      return Tampil(context);
    } else {
      return notFound(context);
    }
  }

  Widget Tampil(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 41, 41, 41),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 2, 255, 95),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    HasilHewan[0].gambarHewan,
                    width: 200,
                  ),
                ),
                Text(
                  HasilHewan[0].namaHewan,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: false,
          blastDirectionality: BlastDirectionality.explosive,
          emissionFrequency: 0.05,
          numberOfParticles: 10,
        ),
      ],
    );
  }

  Widget notFound(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 41, 41, 41),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 2, 255, 95),
          body: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Hewan Tidak Ditemukan",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
