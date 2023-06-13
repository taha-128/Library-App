import 'package:flutter/material.dart';
import 'package:library_app/data/model/book_model.dart';
import 'bottom_section.dart';
import 'custom_app_bar.dart';
import 'custom_button.dart';
import 'upper_section.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(book: book),
              const SizedBox(height: 35),
              UpperSection(book: book),
              const SizedBox(height: 30),
              BottomSection(book: book),
              CustomButton(book: book)
            ],
          ),
        ),
      ),
    );
  }
}
