import 'package:flutter/material.dart';
import 'package:library_app/utils/my_icons.dart';
import '../../utils/widgets/custom_bottom_sheet.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomSheet: SimpleBottomNavigationBar(screens: screens),
      body: HomeScreenBody(),
    );
  }
}

const List<Map<String, dynamic>> screens = [
  {
    'icon': MyIcons.kHomeIcon,
    'title': 'الرئيسية',
    'screen': HomeScreen(),
    'opened': true,
  },
  {
    'icon': MyIcons.kBookIcon,
    'title': 'مكتبتي',
    'screen': 'User_library',
    'opened': false,
  },
  {
    'icon': MyIcons.kHomeIcon,
    'title': 'soon...',
    'screen': 'soon...',
    'opened': false,
  },
];
