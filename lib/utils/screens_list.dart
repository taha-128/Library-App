import 'package:library_app/utils/my_icons.dart';

import '../user_interface/home/home_screen.dart';
import '../user_interface/user_library/user_library_screen.dart';


class MyScreens {
  static List<Map<String, dynamic>> screens = [
    {
      'icon': MyIcons.kHomeIcon,
      'title': 'الرئيسية',
      'screen': const HomeScreen(),
      'opened': true,
    },
    {
      'icon': MyIcons.kBookIcon,
      'title': 'مكتبتي',
      'screen': const UserLibraryScreen(),
      'opened': false,
    },
    {
      'icon': MyIcons.kHomeIcon,
      'title': 'soon...',
      'screen': 'soon...',
      'opened': false,
    },
  ];
}
