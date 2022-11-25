import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_cal/const.dart';

class Numberkey extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var buttomColor = Colors.deepPurple[400];
  Numberkey({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: child == 'c'
                ? Colors.green
                : child == 'DEL'
                    ? Colors.red
                    : buttomColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              child,
              style: styelText,
            ),
          ),
        ),
      ),
    );
  }
}
