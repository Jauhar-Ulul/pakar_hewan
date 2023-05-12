import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  final String gambarCiri = 'assets/image/ciri/meat.svg';

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
                  gambarCiri,
                  width: 100,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Hewan Pemakan Daging',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
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
                onPressed: () {},
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
        ));
  }
}
