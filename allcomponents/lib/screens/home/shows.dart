import 'package:flutter/material.dart';

class Showstab extends StatefulWidget {
  final ColorScheme userTheme;
  final double screenHeight;
  final double screenWidth;

  Showstab({
    Key? key,
    required this.userTheme,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  _ShowsTabContentState createState() => _ShowsTabContentState();
}

class _ShowsTabContentState extends State<Showstab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text('Shows')],
      ),
    );
  }
}
