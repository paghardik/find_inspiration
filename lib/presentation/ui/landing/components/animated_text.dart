import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  @override
  _AnimatedText1State createState() => _AnimatedText1State();
}

class _AnimatedText1State extends State<AnimatedText> {
  bool animationCompeted = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        animationCompeted = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
        child: Text("Find Inspiration",textAlign: TextAlign.center,),
        style: animationCompeted
            ? TextStyle(
                fontSize: 60,
                color: const Color(0xff3e3f68),
                letterSpacing: 4.08,
                fontWeight: FontWeight.bold,
              )
            : TextStyle(
                fontSize: 70,
                color: Colors.transparent,
                letterSpacing: 4.08,
                fontWeight: FontWeight.bold,
              ),
        duration: Duration(milliseconds: 500));
  }
}
