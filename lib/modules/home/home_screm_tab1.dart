import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iti_project/components/components.dart';
import 'package:iti_project/modules/question/ques_screen.dart';

class HomeScreenTab1 extends StatelessWidget{

  final int score;

  const HomeScreenTab1(this.score);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        children: [
          Column(
            children: [
              Text(
                'Welcome To Quiz App',
                style: TextStyle(
                    fontSize: 30.0,
                    color: HexColor('#0A1931'),
                    fontStyle: FontStyle.italic,
                    wordSpacing: 2,
                    height: 3,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'You Are Ready Top Take Quiz!!',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[700],
                    fontStyle: FontStyle.italic,
                    wordSpacing: 1,
                    height: 1.5,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .9,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/img_4.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 150,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Text(
                            'Name: $stName',
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              wordSpacing: 1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'Gender: $stStatus',
                          style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              wordSpacing: 2,
                              height: 2),
                        ),
                        Text(
                          'Score: $score',
                          style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              wordSpacing: 2,
                              height: 2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: defaultButton(
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionScreen(),
                        ));
                  },
                  text: 'All Questions',
                  color: HexColor('537EC5'),
                  height: MediaQuery.of(context).size.height * .06,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
