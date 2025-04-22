import 'package:flutter/material.dart';

class SettingsContent extends StatefulWidget {
  final ColorScheme userTheme;
  final double screenHeight;
  final double screenWidth;

  SettingsContent({
    Key? key,
    required this.userTheme,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  _SettingsContentState createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                children: [
                  Text('Top'),
                ],
              ),
              Column(
                children: [
                  Text('Top'),
                ],
              ),
              const Column(
                children: [
                  Text('End'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}