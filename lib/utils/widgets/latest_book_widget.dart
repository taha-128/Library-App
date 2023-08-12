import 'package:flutter/material.dart';
import 'package:library_app/data/model/book_model.dart';
import 'package:library_app/user_interface/book_details/book_details_screen.dart';
import 'package:library_app/utils/my_styles.dart';
import 'package:star_rating/star_rating.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/my_colors.dart';
import '../../user_interface/home/widgets/book_image.dart';

class BookWidget extends StatelessWidget {
  const BookWidget(
      {super.key, required this.book, this.delete = false, this.onTap});

  final Book book;
  final bool delete;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return ZoomTapAnimation(
      begin: 1,
      end: .9,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsScreen(book: book),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        width: double.infinity,
        height: height * .148,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: MyColors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 14),
            delete
                ? GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'مسح من مكتبتي',
                      style: MyStyles.textStyle18.copyWith(
                        color: Colors.redAccent,
                      ),
                    ),
                  )
                : Container(
                    width: width * .14,
                    height: height * .05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: MyColors.background,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      book.category,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(book.title, style: MyStyles.textStyle18),
                  Text(
                    book.author,
                    style: MyStyles.textStyle18.copyWith(color: Colors.grey),
                  ),
                  StarRating(
                    starSize: 18,
                    between: 2,
                    length: 5,
                    rating: book.rating,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: BookImage(
                book: book,
                size: 150,
                percent: 0.55,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
