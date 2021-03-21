import 'package:find_inspiration/presentation/ui/landing/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/animated_text.dart';
import 'components/rotate_image.dart';

class LandingScreen extends StatelessWidget {
  static const ROUTE_NAME = '/';
  final LandingController _landingController = Get.put(LandingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          RotateImage(),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [AnimatedText()],
            ),
          )
        ],
      ),
    );
  }
}
