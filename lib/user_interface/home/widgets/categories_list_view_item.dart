import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/home_cubit/books_cubit.dart';
import 'package:library_app/utils/my_colors.dart';
import 'package:library_app/utils/my_styles.dart';

class CategoriesListViewItem extends StatelessWidget {
  const CategoriesListViewItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        String category = BlocProvider.of<BooksCubit>(context).category;
        return Container(
          margin: const EdgeInsets.only(left: 12),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: text == category ? MyColors.purple : MyColors.black,
            splashColor: text == category ? MyColors.black : MyColors.purple,
            height: 15,
            onPressed: () {
              BlocProvider.of<BooksCubit>(context).changeShowedBooks(text);
            },
            child: Text(
              text,
              style: MyStyles.textStyle18,
            ),
          ),
        );
      },
    );
  }
}
