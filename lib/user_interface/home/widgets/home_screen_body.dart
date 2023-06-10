import 'package:flutter/material.dart';
import 'books_list_view.dart';
import 'categories_list_view.dart';
import 'custom_app_bar.dart';
import 'latest_books.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        width: double.infinity,
        height: double.infinity,
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomAppBar(),
              SizedBox(height: 30),
              CategoriesListView(),
              SizedBox(height: 25),
              BooksListView(),
              SizedBox(height: 25),
              LatestBooks(),
            ],
          ),
        ),
      ),
    );
  }
}
