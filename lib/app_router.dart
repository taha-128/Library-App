import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/user_interface/book_details/book_details_screen.dart';
import 'package:library_app/user_interface/home/home_screen.dart';

import 'constants/string.dart';

class AppRouter {
  RouterConfig<Object> appRouter = GoRouter(
    routes: [
      GoRoute(
        path: kHomePath,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kHomePath,
        builder: (context, state) => const BookDetailsScreen(),
      ),
    ],
  );
}
