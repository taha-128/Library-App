import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/model/book_model.dart';
import '../../../logic/home_cubit/books_cubit.dart';

import '../../utils/my_images.dart';
import 'widgets/books_list_view.dart';
import 'widgets/categories_list_view.dart';
import 'widgets/latest_books.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Book> books;

  @override
  void initState() {
    BlocProvider.of<BooksCubit>(context).getAllBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 18),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BlocBuilder<BooksCubit, BooksState>(
                builder: (context, state) {
                  if (state is CategoryChanged ||
                      state is BooksLoaded ||
                      state is DeleteBook) {
                    return Column(
                      children: [
                        CategoriesListView(
                          categories:
                              BlocProvider.of<BooksCubit>(context).categories,
                        ),
                        const SizedBox(height: 25),
                        BooksListView(
                          books:
                              BlocProvider.of<BooksCubit>(context).showedBooks,
                        ),
                        const SizedBox(height: 25),
                        const LatestBooks(),
                      ],
                    );
                  } else {
                    return Center(
                      child: Image.asset(MyImages.loadingImage),
                    );
                  }
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
