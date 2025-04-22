import 'package:flutter/material.dart';

class AboutContent extends StatefulWidget {
  final ColorScheme userTheme;
  final double screenHeight;
  final double screenWidth;

  AboutContent({
    Key? key,
    required this.userTheme,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  _AboutContentState createState() => _AboutContentState();
}

class _AboutContentState extends State<AboutContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('About Content'),
    );
  }
}