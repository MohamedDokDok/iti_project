import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iti_project/components/components.dart';
import 'package:iti_project/home_layout/home_layout_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  var nameController = TextEditingController();
  bool isFirstButton = true;
  String status = 'Male';
  String name = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/img_5.png',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Fill Your Data To Test Your Information',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: nameController,
              onChanged: (value){
                name = value;
              },
              keyboardType: TextInputType.name,
              autocorrect: true,
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                hintText: 'Your Name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            defaultTwoButton(
              context: context,
              onPressButton1: () {
                setState(() {
                  isFirstButton = true;
                  status = 'Male';
                });
              },
              onPressButton2: () {
                setState(() {
                  isFirstButton = false;
                  status = 'Female';
                });
              },
              divideColor:
                  !isFirstButton ? HexColor('#0069cc') : HexColor('#cce6ff'),
              colorButton1:
                  isFirstButton ? HexColor('#0069cc') : HexColor('#cce6ff'),
              colorButton2:
                  !isFirstButton ? HexColor('#0069cc') : HexColor('#cce6ff'),
              textFirstButton: 'MALE',
              textSecondButton: 'FEMALE',
              textBaseLine: TextBaseline.ideographic,
            ),
            const SizedBox(
              height: 60.0,
            ),
            defaultButton(
              onPress: name.isEmpty
                  ? null
                  : () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeLayoutScreen(nameController.text, status)),
                          (route) => false);
                    },
              text: 'Next',
              color: name.isEmpty
                  ? HexColor('#cce6ff')
                  : HexColor('#0069cc'),
              height: MediaQuery.of(context).size.height * .06,
            )
          ],
        ),
      ),
    );
  }

  Widget defaultButtonItem(Color color, String text, Color textColor, Function onPress) => Expanded(
    child: Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
      child: MaterialButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24.0,
            color: textColor,
          ),
        ),
      ),
    ),
  );
}
