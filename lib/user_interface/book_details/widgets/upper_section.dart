import 'package:flutter/material.dart';
import 'package:star_rating/star_rating.dart';

import '../../../utils/my_images.dart';
import '../../../utils/my_styles.dart';
import '../../home/widgets/book_image.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('المؤلف : روبرت كيوساكي', style: MyStyles.textStyle18),
              Text('عدد الصفحات : 52', style: MyStyles.textStyle18),
              Text('US : اللغة', style: MyStyles.textStyle18),
              StarRating(
                color: Colors.yellow,
                starSize: 20,
                between: 4,
                length: 5,
                rating: 5,
              ),
            ],
          ),
        ),
        const SizedBox(width: 14),
        BookImage(
          image: MyImages.loadingImage,
          index: 1,
          size: 250,
          percent: .72,
        ),
      ],
    );
  }
}
