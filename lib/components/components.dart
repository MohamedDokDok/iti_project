import 'package:flutter/material.dart';


Widget defaultTwoButton({
  @required context,
  @required Function onPressButton1,
  @required Function onPressButton2,
  @required Color divideColor,
  @required Color colorButton1,
  @required Color colorButton2,
  @required String textFirstButton,
  @required String textSecondButton,
  var textBaseLine = TextBaseline.ideographic,
  Color colorTextButton = Colors.white,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: divideColor,
            borderRadius: const BorderRadiusDirectional.horizontal(
              start: Radius.circular(10.0),
              end: Radius.circular(10.0),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .3,
                height: MediaQuery.of(context).size.height * .045,
                decoration: BoxDecoration(
                  color: colorButton1,
                  borderRadius: BorderRadiusDirectional.circular(10.0),
                ),
                child: MaterialButton(
                  onPressed: onPressButton1,
                  child: Text(
                    textFirstButton,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: colorTextButton,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .3,
                height: MediaQuery.of(context).size.height * .045,
                decoration: BoxDecoration(
                  color: colorButton2,
                  borderRadius: const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(10.0),
                    bottomEnd: Radius.circular(10.0),
                  ),
                ),
                child: MaterialButton(
                  onPressed: onPressButton2,
                  child: Text(
                    textSecondButton,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: colorTextButton,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );



Widget defaultButton({
  @required Function onPress,
  @required String text,
  @required Color color,
  Color textColor = Colors.white,
  double width = double.infinity,
  @required double height,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: MaterialButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18.0,
          ),
        ),
      ),
    );


String stName;
String stStatus;
int stScore;