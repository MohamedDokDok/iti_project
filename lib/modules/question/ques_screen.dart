import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iti_project/components/components.dart';
import 'package:iti_project/modules/result/resilt_screen.dart';

class QuestionScreen extends StatefulWidget {
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {


  Map<String, String> qes = {
    '1': 'متي ظهر تدوين السيرة النبوية',
    '2': 'من هم أخوات النبي في الرضاعه',
    '3': 'كم عدد غوةات النبي صلي الله عليه سلم',
    '4': 'كم عمرة اعتمرها النبي'
  };

  List<int> ansQes = [];

  Map<String, Map> ans = {
    '1': {
      '1': 'في عهد الصحابة',
      '0': 'في عهد التابعين',
      '2': 'في عهد تابعي التابعين',
    },
    '2': {
      '0': 'حمزة',
      '2': 'عبدالله بن أسد',
      '1': 'مسروح/حمزة/عبدالله بن أسد',
    },
    '3': {
      '0': '10',
      '1': '25',
      '2': '30',
    },
    '4': {
      '0' : '6',
      '2' : '10',
      '1' : '4',
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#cce6ff'),
      appBar: AppBar(
        title: const Text(
          'Questions',
          style: TextStyle(
            fontSize: 22.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Wrap(
              children: [
                Text(
                  'Go On $stName',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: HexColor('#0A1931'),
                      fontStyle: FontStyle.italic,
                      wordSpacing: 2,
                      height: 3,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Padding(padding: EdgeInsetsDirectional.only(top: 40)),
            QesBuilderItem(context),
            const Padding(padding: EdgeInsetsDirectional.only(top: 60)),
            Center(
              child: Text(
                'Score ${score()}',
                style: TextStyle(
                    fontSize: 30.0,
                    color: HexColor('#0A1931'),
                    fontStyle: FontStyle.italic,
                    wordSpacing: 2,
                    height: 3,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int temp = 0;
  int temp2 = 0;

  Widget QesBuilderItem(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * .43,
        width: double.infinity,
        padding: const EdgeInsetsDirectional.only(top: 20.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .85,
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white),
              child: Text(
                qes['${temp + 1}'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 2.0,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ansItem(context, temp + 1, temp2),
            const SizedBox(
              height: 5.0,
            ),
            ansItem(context, temp + 1, temp2 + 1),
            const SizedBox(
              height: 5.0,
            ),
            ansItem(context, temp + 1, temp2 + 2),
          ],
        ),
      );

  Widget ansItem(context, index, index2) => InkWell(
        onTap: () {
          setState(() {
            print(ans['$index'].keys.elementAt(index2));
            if (temp < qes.length - 1) {
              temp += 1;
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(score())),
                      (route) => false
              );
            }
            if ((ans['$index'].keys.elementAt(index2)) == '1') {
              ansQes.add(1);
            } else {
              ansQes.add(0);
            }
            print(ansQes);
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * .85,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2.0, color: Colors.blue),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Text(
            '${ans['$index'].values.elementAt(index2)}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              height: 3.0,
            ),
          ),
        ),
      );

  int score() {
    int score = 0;
    ansQes.forEach((element) {
      score += element;
    });
    return score;
    print('scre $score');
  }
}
