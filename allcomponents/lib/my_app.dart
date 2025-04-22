import 'package:AllComponents/screens/about.dart';
import 'package:AllComponents/screens/home.dart';
import 'package:AllComponents/screens/settings.dart';
import 'package:flutter/material.dart';
import 'screens/shared_scaffold.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool userThemeIsDark;
  late double screenHeight;
  late double screenWidth;
  late ColorScheme userTheme;
  late GlobalKey<NavigatorState> navigatorKey;

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
  }

  void changeTheme() {
    setState(() {
      userThemeIsDark = !userThemeIsDark;
      userTheme = userThemeIsDark ? const ColorScheme.dark() : const ColorScheme.light();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userThemeIsDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    userTheme = userThemeIsDark ? const ColorScheme.dark() : const ColorScheme.light();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All Components',
      initialRoute: '/home',
      navigatorKey: navigatorKey,
      themeMode: userThemeIsDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      routes: {
        '/home': (context) => SharedScaffold(
          onThemeChange: changeTheme,
          screenHeight: screenHeight, screenWidth: screenWidth,
          content: HomeContent(userTheme: userTheme, screenHeight: screenHeight, screenWidth: screenWidth),
          userTheme: userTheme,
        ),
        '/settings': (context) => SharedScaffold(
          onThemeChange: changeTheme,
          screenHeight: screenHeight, screenWidth: screenWidth,
          content: SettingsContent(userTheme: userTheme, screenHeight: screenHeight, screenWidth: screenWidth),
          userTheme: userTheme,
        ),
        '/about': (context) => SharedScaffold(
          onThemeChange: changeTheme,
          screenHeight: screenHeight, screenWidth: screenWidth,
          content: AboutContent(userTheme: userTheme, screenHeight: screenHeight, screenWidth: screenWidth),
          userTheme: userTheme,
        ),
      },
      home: SharedScaffold(
        onThemeChange: changeTheme,
        screenHeight: screenHeight, screenWidth: screenWidth,
        content: HomeContent(userTheme: userTheme, screenHeight: screenHeight, screenWidth: screenWidth),
        userTheme: userTheme,
      ),
    );
  }
}