import 'package:flutter/material.dart';
import 'drawer.dart';
import 'bottom_navigation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.toggleTheme,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final String title;
  final VoidCallback toggleTheme;
  final double screenHeight;
  final double screenWidth;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      drawer: MyDrawer(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        context: context,
        screenHeight: widget.screenHeight,
        screenWidth: widget.screenWidth,
      ),
      bottomNavigationBar: MyBottomNavigation(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
    );
  }
}
