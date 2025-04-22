import 'package:flutter/material.dart';

class CategoriesTab extends StatefulWidget {
  final ColorScheme userTheme;
  final double screenHeight;
  final double screenWidth;

  CategoriesTab({
    Key? key,
    required this.userTheme,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  _CategoriesTabContentState createState() => _CategoriesTabContentState();
}

class _CategoriesTabContentState extends State<CategoriesTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text('Categories')],
      ),
    );
  }
}
