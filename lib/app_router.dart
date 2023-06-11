import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/user_interface/book_details/book_details_screen.dart';
import 'package:library_app/user_interface/home/home_screen.dart';

class AppRouter {
  static const String kHomePath = '/BookDetails';
  //Todo: static const String kHomePath = '/';

  static const String kBookDetailsPath = '/';
  //Todo: static const String kBookDetailsPath = '/BookDetails';

  RouterConfig<Object> appRouter = GoRouter(
    routes: [
      GoRoute(
        path: kHomePath,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kBookDetailsPath,
        builder: (context, state) => const BookDetailsScreen(),
      ),
    ],
  );
}
