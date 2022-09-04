import 'package:flutter/material.dart';

import '../constants.dart';

class CardBack extends StatelessWidget {
  final double size;
  final Widget? child;
  const CardBack({Key? key, this.size = 1, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: card_width * size,
      height: card_height * size,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: child ?? Container(),
    );
  }
}
