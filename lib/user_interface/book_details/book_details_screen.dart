import 'package:flutter/material.dart';
import 'package:library_app/user_interface/book_details/widgets/custom_app_bar.dart';

import '../../data/model/book_model.dart';
import 'widgets/bottom_section.dart';
import 'widgets/custom_button.dart';
import 'widgets/upper_section.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
      ),
    );
  }
}
