import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:library_app/data/model/book_model.dart';
import 'package:library_app/logic/cubit/books_cubit.dart';
import 'package:library_app/utils/my_icons.dart';
import 'package:share_plus/share_plus.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Share.share(
                  book.downloadingLink,
                ); //Todo: Share the application
              },
              child: SvgPicture.asset(
                MyIcons.kShareIcon,
                width: 28,
              ),
            ),
            const SizedBox(width: 14),
            GestureDetector(
              onTap: () async {
                await BlocProvider.of<BooksCubit>(context).addToFavourites(
                  book: book,
                  context: context,
                );
              },
              child: SvgPicture.asset(
                MyIcons.kBookmarkIcon,
                width: 28,
              ),
            ),
          ],
        ),
        Text(
          book.title,
          style: const TextStyle(fontSize: 20),
        ),
        const Icon(
          Icons.menu,
          size: 30,
          color: Color(0xFFff00dd),
        )
      ],
    );
  }
}
