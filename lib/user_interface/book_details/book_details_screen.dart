import 'package:flutter/material.dart';
import 'package:library_app/user_interface/book_details/widgets/book_details_screen_body.dart';

import '../../data/model/book_model.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsScreenBody(book: book),
    );
  }
}
