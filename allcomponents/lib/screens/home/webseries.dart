import 'package:flutter/material.dart';

class WebSeriestab extends StatefulWidget {
  final ColorScheme userTheme;
  final double screenHeight;
  final double screenWidth;

  WebSeriestab({
    Key? key,
    required this.userTheme,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  _WebSeriesTabContentState createState() => _WebSeriesTabContentState();
}

class _WebSeriesTabContentState extends State<WebSeriestab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text('Web Series')],
      ),
    );
  }
}