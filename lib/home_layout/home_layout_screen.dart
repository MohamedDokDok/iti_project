import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iti_project/components/components.dart';
import 'package:iti_project/modules/home/home_screm_tab1.dart';
import 'package:iti_project/modules/question/ques_screen.dart';
import 'package:iti_project/modules/tips/tips_screen.dart';

class HomeLayoutScreen extends StatefulWidget {
  HomeLayoutScreen(String name, String status, {int score = 0}) {
    stName = name;
    stStatus = status;
    stScore = score;
  }

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  String temp = '';
  var rateController = TextEditingController();
  var nameController = TextEditingController();
  bool isFirstButton = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: HexColor('#cce6ff'),
        drawer: drawerBuilder(context),
        appBar: AppBar(
          title: const Text(
            'Quizzes',
          ),
          centerTitle: true,
          backgroundColor: HexColor('#0069cc'),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'Home',
              ),
              Tab(
                text: 'Tips',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreenTab1(stScore),
            TipsScreenTap2(),
          ],
        ),
      ),
    );
  }

  Widget drawerBuilder(context) => Drawer(
        child: Column(
          children: [
            Container(
              color: HexColor('1597BB'),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .3,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage(
                        'assets/images/img.png',
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          stStatus,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  stScore = 0;
                });
                Navigator.pop(context);
              },
              leading: const Icon(
                Icons.restore,
                color: Colors.lightBlue,
              ),
              title: const Text(
                'Reset Score',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: Colors.grey[400],
                          title: const Text(
                            'Rate',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          content: SizedBox(
                            height: MediaQuery.of(context).size.height * .2,
                            child: Column(
                              children: [
                                Container(
                                  child: TextFormField(
                                    controller: rateController,
                                    keyboardType: TextInputType.phone,
                                    maxLength: 2,
                                    autofocus: true,
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.star,
                                        color: Colors.blueAccent,
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Your Rate',
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(20.0),
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                defaultButton(
                                  onPress: () {
                                    Navigator.pop(context);
                                  },
                                  text: 'Done',
                                  color: Colors.lightGreenAccent,
                                  height:
                                      MediaQuery.of(context).size.height * .06,
                                  width: MediaQuery.of(context).size.width * .4,
                                )
                              ],
                            ),
                          ),
                        ));
              },
              leading: const Icon(
                Icons.star_border_outlined,
                color: Colors.lightBlue,
              ),
              title: const Text(
                'Rate',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              subtitle: rateController.text.isNotEmpty
                  ? Text(
                      'Your rate is ${rateController.text}',
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    )
                  : null,
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.grey[400],
                    title: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    content: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .25,
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.blueAccent,
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Name',
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(30.0),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            defaultTwoButton(
                              context: context,
                              onPressButton1: () {
                                setState(() {
                                  isFirstButton = true;
                                  print(isFirstButton);
                                  stStatus = 'Male';
                                });
                              },
                              onPressButton2: () {
                                setState(() {
                                  isFirstButton = false;
                                  print(isFirstButton);
                                  stStatus = 'Female';
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
                              height: 15.0,
                            ),
                            defaultButton(
                              onPress: () {
                                setState(() {
                                  if(nameController.text.isNotEmpty) {
                                    stName = nameController.text.toString();
                                  }
                                });
                                Navigator.pop(context);
                              },
                              text: 'Done',
                              color: Colors.lightGreenAccent,
                              height: MediaQuery.of(context).size.height * .06,
                              width: MediaQuery.of(context).size.width * .4,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              leading: const Icon(
                Icons.settings,
                color: Colors.lightBlue,
              ),
              title: const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      );
}
