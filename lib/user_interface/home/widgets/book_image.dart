import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../constants/colors.dart';
import '../../../constants/string.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.image, required this.index, required this.size});
  final String image;
  final int index;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      begin: 1,
      end: .9,
      onTap: () {
        //TODO: Navigate to Book Details by index
      },
      child: SizedBox(
        width: size * .8,
        height: size,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 1),
            color: MyColors.black,
          ),
          child: true //* image != null
              ? const FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage(loadingImage),
                  image: AssetImage(
                    //* NetworkImage(bookImage)
                    loadingImage,
                  ),
                )
              : Image.asset(errorImage),
        ),
      ),
    );
  }
}
