import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(108, 255, 255, 255),
        title: Text(
          "تطابق الصور ",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: imagesPage(),
    ),
  ));
}

int randomnum() {
  int randomNum = Random().nextInt(9) + 1;
  return randomNum;
}

class imagesPage extends StatefulWidget {
  imagesPage({super.key});

  @override
  State<imagesPage> createState() => _imagesPageState();
}

class _imagesPageState extends State<imagesPage> {
// varibls
  int rightPic = 1; //  حسب عدد الصور ما بين 1 / 9
  int leftPic = 1;
  String message = "حاول مره اخرى";
  int points = 0;
// varibls

  void check() {
    if (leftPic == rightPic) {
      setState(() {
        message = "حصلت على نقطة يا محترم";
        points = points + 1;
      });
    } else {
      setState(() {
        message = "حاول مرة أخرى";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
          child: Text(
            message,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          " $points  : النقاط ",
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftPic = randomnum();
                      check();
                    });
                  },
                  child: Image(
                    image: AssetImage("assets/image-$leftPic.png"),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      rightPic = randomnum();
                      check();
                    });
                  },
                  child: Image(
                    image: AssetImage("assets/image-$rightPic.png"),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
