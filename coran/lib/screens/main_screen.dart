import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:coran/screens/audios_screen.dart';
import 'package:coran/screens/globales.dart';
import 'package:coran/screens/home_screen.dart';
import 'package:coran/screens/priere_screen.dart';
import 'package:coran/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectindex = 0;
  List<Widget> _widgetsList =[HomeScreen(),PriereScreen(), AudiosScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_widgetsList[_selectindex] ,
  bottomNavigationBar: ConvexAppBar(
    color: Colors.white,
    items: [
      TabItem(icon: Icons.home, title: 'Home'),
      TabItem(icon: Icons.add, title: 'Priere'),
      TabItem(icon: Icons.audiotrack, title: 'Audio'),
      // TabItem(icon: Icons.message, title: 'Message'),
      TabItem(icon: Icons.people, title: 'Profile'),
    ],
    initialActiveIndex: 0,
    onTap: updateIndex,
    backgroundColor: gray,
    activeColor: Colors.white,
  )
);
  }

  void updateIndex(index){
    setState(() {
      _selectindex = index;
      });
  }
}