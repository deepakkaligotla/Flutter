import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.context,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int) onItemTapped;
  final BuildContext context;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: screenWidth/2.5,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            accountName: Text('Drawer Header'),
            accountEmail: Text('deepak.kaligotla@gmail.com'),
          ),
          buildDrawerItem(Icons.home, 'Home', 0),
          buildDrawerItem(Icons.settings, 'Settings', 1),
          buildDrawerItem(Icons.info, 'About', 2),
        ],
      ),
    );
  }

  ListTile buildDrawerItem(IconData iconData, String title, int index) {
    return ListTile(
      title: Row(
        children: [
          Icon(iconData),
          const SizedBox(width: 16),
          Text(title),
        ],
      ),
      selected: selectedIndex == index,
      onTap: () {
        onItemTapped(index);
        Navigator.pop(context);
      },
    );
  }
}
