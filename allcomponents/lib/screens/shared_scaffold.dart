import 'package:flutter/material.dart';
import 'app_search.dart';

class SharedScaffold extends StatefulWidget {
  final VoidCallback onThemeChange;
  final ColorScheme userTheme;
  final double screenHeight;
  final double screenWidth;
  final Widget content;

  SharedScaffold({
    Key? key,
    required this.onThemeChange,
    required this.userTheme,
    required this.screenHeight,
    required this.screenWidth,
    required this.content,
  }) : super(key: key);


  @override
  _SharedScaffoldState createState() => _SharedScaffoldState();
}

class _SharedScaffoldState extends State<SharedScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: Navigator.of(context).popAndPushNamed('/home');
        break;
      case 1: Navigator.of(context).popAndPushNamed('/settings');
        break;
      case 2: Navigator.of(context).popAndPushNamed('/about');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppSearch(),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              widget.onThemeChange();
            },
          ),
        ],
      ),
      drawer: Drawer(
        width: widget.screenWidth/2.5,
        backgroundColor: widget.userTheme.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: widget.userTheme.shadow,
              ),
              child: Image.network('https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
              },
            ),
            ListTile(
              title: const Text('About'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
              },
            ),
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: widget.userTheme.background,
        items: [
          buildBottomNavItem('Home', Icons.home_outlined, Icons.home_filled, 'Home Screen'),
          buildBottomNavItem('Settings', Icons.settings_outlined, Icons.settings, 'Settings Screen'),
          buildBottomNavItem('About', Icons.info_outline, Icons.info_sharp, 'About Screen'),
        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:Navigator.pushNamed(context, '/home');
            break;
            case 1:Navigator.pushNamed(context, '/settings');
            break;
            case 2:Navigator.pushNamed(context, '/about');
            break;
          }
        },
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 0, maxWidth: widget.screenWidth, minHeight: 0, maxHeight: widget.screenHeight),
        child: widget.content,
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavItem(String label, IconData icon, IconData activeIcon, String tooltip) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(icon),
      activeIcon: Icon(activeIcon, color: Colors.indigo),
      backgroundColor: Colors.yellow,
      tooltip: tooltip,
    );
  }
}