import 'package:flutter/material.dart';
import 'package:ui_bardi/AddItem/item_main.dart';
import 'package:ui_bardi/Menu/rumah.dart';
import 'package:ui_bardi/Menu/automisasi.dart';
import 'package:ui_bardi/Menu/mall.dart';
import 'package:ui_bardi/Menu/saya.dart';
import 'package:ui_bardi/loginsharedpreference.dart';


class bardi extends StatefulWidget {
  const bardi({Key? key}) : super(key: key);

  @override
  State createState() => Homepage();
}

class Homepage extends State<bardi> {
  int _selectedNavbar = 0;
  void _changeBottomNav(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }
  final List<Widget> _children =
  [
    rumah(),
    automisasi(),
    mall(),
    saya(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home :Scaffold(
        body: _children[_selectedNavbar],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedNavbar,
          selectedItemColor: Colors.cyan,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: _changeBottomNav,
          items:   const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Rumah'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.wb_sunny_outlined),
                label: 'Automisasi'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Mail'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Saya'
            ),
          ],

        ),
      ),
    );
  }
}