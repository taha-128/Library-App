import 'package:flutter/material.dart';
import 'package:library_app/utils/my_colors.dart';
import 'package:library_app/utils/my_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class BookImage extends StatelessWidget {
  const BookImage(
      {super.key,
      required this.image,
      required this.index,
      required this.size,
      required this.percent});
  final String image;
  final int index;
  final double size, percent;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      begin: 1,
      end: .9,
      onTap: () {
        //TODO: Navigate to Book Details by index
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
              : Image.asset(MyImages.errorImage),
        ),
      ),
    );
  }
}
