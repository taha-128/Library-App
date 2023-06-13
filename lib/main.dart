import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/logic/cubit/books_cubit.dart';
import 'package:library_app/notification_service.dart';
import 'package:library_app/user_interface/home/home_screen.dart';
import 'package:library_app/utils/my_colors.dart';

void main() {
  NotificationService().initNotifi();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
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
