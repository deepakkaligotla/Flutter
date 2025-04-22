import 'package:flutter/material.dart';
import 'home/kids.dart';
import 'home/movies.dart';
import 'home/shows.dart';
import 'home/webseries.dart';
import 'home/categories.dart';

class HomeContent extends StatefulWidget {
  final ColorScheme userTheme;
  final double screenHeight;
  final double screenWidth;

  HomeContent({
    Key? key,
    required this.userTheme,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Tab> tabItems = [
    Tab(icon: Icon(Icons.movie), text: 'Movies'),
    Tab(icon: Icon(Icons.tv), text: 'Shows'),
    Tab(icon: Icon(Icons.web), text: 'Web Series'),
    Tab(icon: Icon(Icons.child_friendly), text: 'Kids'),
    Tab(icon: Icon(Icons.category), text: 'Categories')
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenWidth,
      height: widget.screenHeight,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: TabBar(
              tabs: tabItems,
            ),
          ),
          body: TabBarView(
            children: [
              Moviestab(
                userTheme: widget.userTheme,
                screenHeight: widget.screenHeight,
                screenWidth: widget.screenWidth,
              ),
              Showstab(
                userTheme: widget.userTheme,
                screenHeight: widget.screenHeight,
                screenWidth: widget.screenWidth,
              ),
              WebSeriestab(
                userTheme: widget.userTheme,
                screenHeight: widget.screenHeight,
                screenWidth: widget.screenWidth,
              ),
              Kidstab(
                userTheme: widget.userTheme,
                screenHeight: widget.screenHeight,
                screenWidth: widget.screenWidth,
              ),
              CategoriesTab(
                userTheme: widget.userTheme,
                screenHeight: widget.screenHeight,
                screenWidth: widget.screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
