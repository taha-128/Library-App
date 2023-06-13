import 'package:flutter/material.dart';
import 'package:library_app/data/model/book_model.dart';
import 'package:library_app/utils/my_styles.dart';
import 'latest_book_widget.dart';

class LatestBooks extends StatelessWidget {
  const LatestBooks({super.key, required this.books});
  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'أحدث الإصدارات',
          style: MyStyles.textStyle26.copyWith(fontSize: 22),
        ),
        const SizedBox(height: 5),
        LatestBookWidget(book: books[1]),
        const SizedBox(height: 15),
        LatestBookWidget(book: books[0]),
      ],
    );
  }
}
