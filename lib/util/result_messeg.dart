import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_cal/const.dart';

class resultMesseg extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  final icon;
  const resultMesseg(
      {Key? key,
      required this.message,
      required this.onTap,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        color: Colors.deepPurple,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              message,
              style: styelText,
            ),

            //button to next question
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(icon),
              ),
            )
          ],
        ),
      ),
    );
  }
}
