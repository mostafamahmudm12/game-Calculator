import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_cal/const.dart';
import 'package:game_cal/util/number_key.dart';
import 'package:game_cal/util/result_messeg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> numberpad = [
  '7',
  '8',
  '9',
  'C',
  '4',
  '5',
  '6',
  'DEL',
  '1',
  '2',
  '3',
  '=',
  '0',
];

class _HomePageState extends State<HomePage> {
  //user anser
  String userAnser = '';

  /// user tapped a button
  void buttontapped(String button) {
    setState(() {
      if (button == '=') {
        checkResult();
        //calculate if user is correct or incorrect
      } else if (button == 'C') {
        // بيمسح كل الارقام
        //clear the input
        userAnser = '';
      } else if (button == 'DEL') {
        //بيمسح اخر عنصر
        //delete the last number
        if (userAnser.isNotEmpty) {
          userAnser = userAnser.substring(0, userAnser.length - 1);
        }
      } else if (userAnser.length < 3) {
        //maximum of 3 number can be inputted
        userAnser += button;
      }
    });
  }

  int numberA = 1;
  int numberB = 2;

  // check if user is correct or notcorrect
  // بيشوف لو اجابت المستخدم صح او غلط
  void checkResult() {
    if (numberA + numberB == int.parse(userAnser)) {
      showDialog(
          context: context,
          builder: (context) {
            return resultMesseg(
                message: 'Correct!',
                onTap: gotoNextQuestion,
                icon: Icons.arrow_forward);
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return resultMesseg(
                message: 'Sorry try again',
                onTap: gotoBackQuestion,
                icon: Icons.rotate_left);
          });
    }
  }

  // create random numbers
  //عباره عن ارقام عشوايه في اللغه
  var randomNumbers = Random();
  void gotoNextQuestion() {
    Navigator.of(context).pop();

//اعادة تعيين
    setState(() {
      userAnser = '';
    });

    // سوال جديد
    numberA = randomNumbers.nextInt(100);
    numberB = randomNumbers.nextInt(100);
  }

  void gotoBackQuestion() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          //دي علشان المستوه يعني لم تجاوب علي سوال هيعمل تقدم للمستوه
          Container(
            height: 160,
            width: double.infinity,
            color: Colors.deepPurple,
            child: Icon(
              Icons.android_sharp,
              size: 140,
            ),
          ),
          //question
          Expanded(
              child: Center(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //question
                  Text(
                    numberA.toString() + '+' + numberB.toString() + '=',
                    style: styelText,
                  ),
                  //answer box
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        userAnser,
                        style: styelText,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          //number pad
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                    //دي علشان العناصر تكون غير قابله
                    /// Scroll
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: numberpad.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return Numberkey(
                        child: numberpad[index],
                        //عباره عن fu معؤفها في ال
                        // number_key
                        onTap: () {
                          return buttontapped(numberpad[index]);
                        },
                      );
                    }),
              )),
        ],
      ),
    );
  }
}
