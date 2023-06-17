import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_page.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class Result extends StatefulWidget {
  final List<String> hasil;
  Result({super.key, required this.hasil});

  @override
  State<Result> createState() => _Result(hasil: hasil);
}

class Hewan {
  String gambarHewan;
  String namaHewan;
  List<String> rumus;
  Hewan(
      {required this.gambarHewan,
      required this.namaHewan,
      required this.rumus});
}

class _Result extends State<Result> {
  final List<String> hasil;
  _Result({required this.hasil});

  bool isPlaying = false;
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();

    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    'assets/image/hewan/hiu.svg',
                    width: 200,
                  ),
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
}
