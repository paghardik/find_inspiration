import 'dart:ui';

import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final String? price;
  const PriceWidget({
    Key? key, this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  price!.replaceFirst(" ", "\n"), textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w700),),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}