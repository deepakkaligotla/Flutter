import 'package:flutter/material.dart';

class Moviestab extends StatefulWidget {
  final ColorScheme userTheme;
  final double screenHeight;
  final double screenWidth;

  Moviestab({
    Key? key,
    required this.userTheme,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  _MoviesTabContentState createState() => _MoviesTabContentState();
}

class _MoviesTabContentState extends State<Moviestab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(
          minWidth: 0,
          maxWidth: widget.screenWidth,
          minHeight: 0,
          maxHeight: double.maxFinite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Movies')
          ],
        ),
      ),
    );
  }
}
