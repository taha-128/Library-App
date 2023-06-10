import 'package:flutter/material.dart';
import 'package:library_app/app_router.dart';
import 'package:library_app/utils/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().appRouter,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.background,
        fontFamily: 'SansArabic',
        brightness: Brightness.dark,
      ),
    );
  }
}
