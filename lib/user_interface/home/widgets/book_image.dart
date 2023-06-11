import 'package:flutter/material.dart';
import 'package:library_app/user_interface/book_details/book_details_screen.dart';
import 'package:library_app/utils/my_colors.dart';
import 'package:library_app/utils/my_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    required this.size,
    required this.percent,
    this.push,
    required String image,
  });
  final double size, percent;
  final bool? push;
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      begin: 1,
      end: .9,
      onTap: () {
        push ?? true
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(),
                ),
              )
            : null;
      },
      child: SizedBox(
        width: size * percent,
        height: size,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: MyColors.black,
          ),
          child: true //* image != null
              ? const FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage(MyImages.loadingImage),
                  image: AssetImage(
                    //* NetworkImage(bookImage)
                    MyImages.loadingImage,
                  ),
                )
              // ignore: dead_code
              : Image.asset(MyImages.errorImage),
        ),
      ),
    );
  }
}
