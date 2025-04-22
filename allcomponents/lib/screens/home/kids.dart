import 'package:flutter/material.dart';

class Kidstab extends StatefulWidget {
  final ColorScheme userTheme;
  final double screenHeight;
  final double screenWidth;

  Kidstab({
    Key? key,
    required this.userTheme,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  _KidsTabContentState createState() => _KidsTabContentState();
}

class _KidsTabContentState extends State<Kidstab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text('Kids')],
      ),
    );
  }
}