import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  int rng;
  String imageName = "question";

  List imageNames = [
    "EdSheeran",
    "BaSai",
    "KeanuReeves",
    "RobertPattinson",
    "RyanReynolds",
    "BenAffleck",
    "TheRock"
  ];

  Random random = Random();
  void pickRandomImage() {
    rng = random.nextInt(7);
    setState(() {
      imageName = imageNames[rng];
    });
    print(imageName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdddddd),
      appBar: AppBar(
        backgroundColor: Color(0xff30475e),
        title: Text(
          "Look Like",
          style: TextStyle(color: Color(0xffdddddd)),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Text(
                "Which celebrity do you look like?",
                style: TextStyle(color: Color(0xff30475e), fontSize: 25),
              ),
            ),
          ),
          Container(
            height: 300,
            width: 250,
            child: Image.asset('images/$imageName.png'),
          ),

          rng == null
              ? Container()
              : Text(
                  "You Look Like " + imageNames[rng] + ".",
                  style: TextStyle(color: Color(0xff30475e), fontSize: 20),
                ),

          SizedBox(
            height: 80,
          ),
          InkWell(
            splashColor: Color(0xfff05454),
            onTap: () {
              pickRandomImage();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff30475e),
              ),
              height: 55,
              width: 250,
              child: Center(
                  child: Text(
                "Let's Find Out",
                style: TextStyle(fontSize: 18, color: Color(0xffdddddd)),
              )),
            ),
          )
        ],
      ),
    );
  }
}
