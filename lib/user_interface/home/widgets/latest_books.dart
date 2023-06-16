import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/model/book_model.dart';
import 'package:library_app/logic/cubit/books_cubit.dart';
import 'package:library_app/utils/my_styles.dart';
import 'latest_book_widget.dart';

class LatestBooks extends StatelessWidget {
  const LatestBooks({super.key});

  @override
  Widget build(BuildContext context) {
    List<Book> books =
        BlocProvider.of<BooksCubit>(context).books.reversed.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'أحدث الإصدارات',
          style: MyStyles.textStyle26.copyWith(fontSize: 22),
        ),
        const SizedBox(height: 5),
        LatestBookWidget(book: books[0]),
        const SizedBox(height: 15),
        LatestBookWidget(book: books[1]),
      ],
    );
  }
}
