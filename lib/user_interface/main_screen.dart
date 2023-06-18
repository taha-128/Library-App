// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:library_app/user_interface/home/widgets/custom_app_bar.dart';
import 'package:library_app/user_interface/user_library/user_library_screen.dart';
import 'package:library_app/utils/my_colors.dart';
import 'package:library_app/utils/my_icons.dart';
import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: items,
      ),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: CustomAppBar(),
        ),
        elevation: 0,
        backgroundColor: MyColors.background,
      ),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}

const List<Widget> _pages = <Widget>[
  HomeScreen(),
  UserLibraryScreen(),
  HomeScreen(),
];

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: SvgPicture.asset(MyIcons.kHomeIcon, height: 30, color: Colors.grey),
    activeIcon:
        SvgPicture.asset(MyIcons.kHomeIcon, height: 30, color: Colors.white),
    label: 'قريبا...',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(MyIcons.kBookIcon, height: 30, color: Colors.grey),
    activeIcon:
        SvgPicture.asset(MyIcons.kBookIcon, height: 30, color: Colors.white),
    label: 'مكتبتي',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(MyIcons.kHomeIcon, height: 30, color: Colors.grey),
    activeIcon:
        SvgPicture.asset(MyIcons.kHomeIcon, height: 30, color: Colors.white),
    label: 'الرئيسية',
  ),
];
