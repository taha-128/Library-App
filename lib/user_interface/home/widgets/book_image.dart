import 'package:flutter/material.dart';
import 'package:library_app/user_interface/book_details/book_details_screen.dart';
import 'package:library_app/utils/my_colors.dart';
import 'package:library_app/utils/my_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/model/book_model.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    required this.size,
    required this.percent,
    required this.book,
    this.push = true,
  });
  final double size, percent;
  final bool push;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      begin: 1,
      end: .95,
      onTap: () {
        push
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(
                    book: book,
                  ),
                ),
              )
            : null;
      },
      child: SizedBox(
        width: size * percent,
        height: size,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: MyColors.black,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: FadeInImage(
              width: size * percent,
              height: size,
              fit: BoxFit.fill,
              placeholder: const AssetImage(
                MyImages.loadingImage,
              ),
              image: NetworkImage(book.thumbnail),
            ),
          ),
        ),
      ),
    );
  }
}
