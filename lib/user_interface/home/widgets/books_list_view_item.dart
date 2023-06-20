import 'package:flutter/material.dart';

import 'package:star_rating/star_rating.dart';
import '../../../data/model/book_model.dart';
import 'book_image.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BookImage(book: book, size: 180, percent: .8),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                StarRating(
                  mainAxisAlignment: MainAxisAlignment.end,
                  starSize: 22,
                  between: 4,
                  length: 5,
                  rating: book.rating,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
