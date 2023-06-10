import 'package:flutter/material.dart';
import 'package:star_rating/star_rating.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../constants/colors.dart';
import '../../../constants/string.dart';
import 'book_image.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BookImage(image: loadingImage, index: 1),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'الأب الغني والأب الفقير', //* Book title
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                StarRating(
                  starSize: 22,
                  between: 4,
                  length: 5,
                  rating: 3.5,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
