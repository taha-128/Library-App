import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/home_cubit/books_cubit.dart';
import 'package:library_app/notification_service.dart';
import 'package:library_app/user_interface/main_screen.dart';
import 'package:library_app/utils/my_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
void main() async {
  NotificationService().initNotifi();
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BooksCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: MyColors.background,
          fontFamily: 'SansArabic',
          brightness: Brightness.dark,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ),
    );
  }
}
