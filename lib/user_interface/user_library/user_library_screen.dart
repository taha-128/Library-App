import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/model/book_model.dart';
import 'package:library_app/logic/cubit/books_cubit.dart';
import 'package:library_app/utils/widgets/latest_book_widget.dart';

class UserLibraryScreen extends StatelessWidget {
  const UserLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BooksCubit, BooksState>(
          builder: (context, state) {
            BooksCubit cubit = BlocProvider.of<BooksCubit>(context);
            List<Book> books = cubit.favouriteBooks;
            return ListView.builder(
              itemCount: books.length,
              padding: const EdgeInsets.only(top: 18),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: BookWidget(
                    book: books[index],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
