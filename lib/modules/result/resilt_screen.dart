import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iti_project/components/components.dart';
import 'package:iti_project/home_layout/home_layout_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen(this.score);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#cce6ff'),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height *.7,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/img_1.png',
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsetsDirectional.only(
            top: 30.0,
          )),
          Text(
            'Score is ${this.score}',
            style: TextStyle(
                fontSize: 30.0,
                color: HexColor('#0A1931'),
                fontStyle: FontStyle.italic,
                wordSpacing: 2,
                height: 3,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30.0,
          ),
          defaultButton(
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeLayoutScreen(
                              stName,
                              stStatus,
                              score: score,
                            )));
              },
              text: 'Back To Home',
              color: HexColor('537EC5'),
              height: MediaQuery.of(context).size.height * .06,
              width: MediaQuery.of(context).size.width * .8),
        ],
      ),
    );
  }
}
