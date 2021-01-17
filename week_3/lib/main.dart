import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}

enum Gender { male, female }
const activeColor = Color(0xff222831);
const inactiveColor = Color(0xff30475e);

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Gender selectedGender;
  String imageName = "question";

  List imageNames = [
    "EdSheeran", // imageNames[0]
    "BaSai", //imageNames[1]
    "KeanuReeves", //imageNames[2]
    "RobertPattinson", //imageNames[3]
    "RyanReynolds", //imageNames[4]
    "BenAffleck", //imageNames[5]
    "TheRock" //imageNames[6]
  ];

  Random random = Random();
  int rng;
  void pickRandomImage() {
    rng = random.nextInt(7); // 0 to 6

    if (selectedGender == Gender.male) {
      setState(() {
        imageName = imageNames[rng]; // imageName = "BenAffleck"
      });
    }
    if (selectedGender == Gender.female) {
      print("Female");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdddddd),
      appBar: AppBar(
        backgroundColor: Color(0xff30475e),
        title: Text(
          "Look Like",
          style: GoogleFonts.lato(color: Color(0xffdddddd)),
        ),
      ),
      body: Column(
        children: [
          //Upper Text

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Choose your gender.",
                style: TextStyle(color: Color(0xff30475e), fontSize: 25),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NewWidget(
                buttonColor: (selectedGender == Gender.male)
                    ? activeColor
                    : inactiveColor,
                buttonName: "Male",
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
              ),
              NewWidget(
                buttonColor: (selectedGender == Gender.female)
                    ? activeColor
                    : inactiveColor,
                buttonName: "Female",
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Text(
                "Which celebrity do you look like?",
                style: TextStyle(color: Color(0xff30475e), fontSize: 25),
              ),
            ),
          ),

          //Middle Container
          Container(
            height: 300,
            width: 250,
            child: Image.asset('images/$imageName.png'),
          ),

          rng == null
              ? Container()
              : Text(
                  "You Look Like " + imageName + ".",
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

class NewWidget extends StatelessWidget {
  final String buttonName;
  final Function onTap;
  final Color buttonColor;
  NewWidget({this.buttonName, this.onTap, this.buttonColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 130,
        color: buttonColor,
        child: Center(
            child: Text(
          buttonName,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}
