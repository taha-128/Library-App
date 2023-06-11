import 'package:flutter/material.dart';
import 'package:star_rating/star_rating.dart';

import '../../../utils/my_images.dart';
import '../../../utils/my_styles.dart';
import '../../home/widgets/book_image.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
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
              Text('2011-9-18 : تاريخ النشر', style: MyStyles.textStyle18),
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
        SizedBox(width: 14),
        BookImage(
          image: MyImages.loadingImage,
          percent: .72,
          push: false,
          size: 250,
        ),
      ],
    );
  }
}
