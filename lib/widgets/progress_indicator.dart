import 'package:credit_and_conversation/constants/constants.dart';
import 'package:flutter/material.dart';

class ShowProgressIndicator extends StatelessWidget {
  final double opacity;
  const ShowProgressIndicator({super.key, this.opacity = 1.0});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 500),
      child: Center(
        child: Container(
            color: Colors.transparent.withOpacity(opacity),
            width: width,
            height: height,
            child: CircularProgressIndicator(
              color: goldenColor,
            )),
      ),
    );
  }
}
