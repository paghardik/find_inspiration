import 'dart:ui';

import 'package:flutter/material.dart';

class CircularIndicatorBlur extends StatelessWidget {
  const CircularIndicatorBlur({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.center,
          child: Stack(
            fit: StackFit.loose,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: CircularProgressIndicator(),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              /*       Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(
            child: Image.network("https://picsum.photos/200"),
          ),
        )*/
            ],
          ),
        )
      ],
    );
  }
}
