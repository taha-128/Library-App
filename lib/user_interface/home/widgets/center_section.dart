import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/books_cubit.dart';
import '../../../utils/my_images.dart';
import 'books_list_view.dart';
import 'categories_list_view.dart';
import 'latest_books.dart';

class CenterSection extends StatelessWidget {
  const CenterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is CategoryChanged || state is BooksLoaded) {
          return Column(
            children: [
              CategoriesListView(
                categories: BlocProvider.of<BooksCubit>(context).categories,
              ),
              const SizedBox(height: 25),
              BooksListView(
                books: BlocProvider.of<BooksCubit>(context).showedBooks,
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
    );
  }
}
