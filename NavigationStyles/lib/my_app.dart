import 'package:flutter/material.dart';
import 'my_home_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isDarkTheme;
  late double screenHeight;
  late double screenWidth;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      isDarkTheme = MediaQuery.of(context).platformBrightness == Brightness.dark;
      screenHeight = MediaQuery.of(context).size.height;
      screenWidth = MediaQuery.of(context).size.width;
      setState(() {});
    });
  }

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deepak Kaligotla',
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(
        title: 'Home Page',
        toggleTheme: toggleTheme,
        screenHeight: screenHeight,
        screenWidth: screenWidth,
      ),
    );
  }
}
