import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:quraan_read/user/bookmark.dart';
import 'package:quraan_read/user/homeScreen.dart';
import 'package:quraan_read/user/welcome.dart';

// ignore: camel_case_types
class bottomNav extends StatefulWidget {
  bottomNav({Key? key}) : super(key: key);

  @override
  State<bottomNav> createState() => _bottomNavState();
}

// ignore: camel_case_types
class _bottomNavState extends State<bottomNav> {
  @override

  List pages = [
    const Wellcome(),
    const Bookmark(),
    const HomeScreen(),
    const HomeScreen(),
    
  ];

   int _currentIndex = 0;
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar:
           ConvexAppBar(
            onTap: onTap,
            initialActiveIndex: _currentIndex,
            backgroundColor: Colors.deepPurple,
            color: Colors.white24,
            activeColor: Colors.white,
            style: TabStyle.react,
            items: const [
              TabItem(icon: Icons.book_online_outlined, title: 'Al-Quraan'),
              TabItem(icon: Icons.bookmark, title: 'Bookmark'),
              TabItem(icon: Icons.search, title: 'Search'),
              TabItem(icon: Icons.person_outline_outlined, title: 'Profile'),
            ],
          ),
        ),
      
    );
  }
}
