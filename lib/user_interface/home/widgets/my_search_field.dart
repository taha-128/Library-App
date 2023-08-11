import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/utils/my_styles.dart';
import 'package:searchfield/searchfield.dart';
import '../../../logic/home_cubit/books_cubit.dart';
import '../../book_details/book_details_screen.dart';

class MySearchField extends StatelessWidget {
  const MySearchField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    BooksCubit cubit = BlocProvider.of<BooksCubit>(context);

    return SearchField<String>(
      searchStyle: MyStyles.textStyle18.copyWith(fontWeight: FontWeight.w500),
      controller: controller,
      suggestions: cubit.booksForSearch
          .map(
            (title) => SearchFieldListItem<String>(
              title,
              item: title,
              child: Container(
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.only(right: 12),
                alignment: Alignment.centerRight,
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: MyStyles.textStyle18.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
          .toList(),
      hint: 'ابحث عن أي كتاب',
      onSubmit: (title) {
        if (cubit.booksForSearch.contains(title)) {
          controller.clear();
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailsScreen(
                book: cubit.books.firstWhere(
                  (book) => book.title == title,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
