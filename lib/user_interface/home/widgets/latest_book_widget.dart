import 'package:flutter/material.dart';
import 'package:library_app/utils/my_images.dart';
import 'package:library_app/utils/my_styles.dart';
import 'package:star_rating/star_rating.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/my_colors.dart';
import 'book_image.dart';

class LatestBookWidget extends StatelessWidget {
  const LatestBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      begin: 1,
      end: .9,
      onTap: () {
        //TODO: Navigate to book details
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: MyColors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 100,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'نظام الحاسوب',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 22),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('الأب الغني والأب الفقير', style: MyStyles.textStyle18),
                  Text(
                    'روبرت كيوساكي',
                    style: MyStyles.textStyle18.copyWith(color: Colors.grey),
                  ),
                  StarRating(
                    starSize: 18,
                    between: 2,
                    length: 5,
                    rating: 3.5,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            BookImage(
              image: MyImages.loadingImage,
              index: 1,
              size: 150,
              percent: 0.57,
            ),
          ],
        ),
      ),
    );
  }
}
