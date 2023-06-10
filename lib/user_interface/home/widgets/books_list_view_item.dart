import 'package:flutter/material.dart';
import 'package:library_app/utils/my_images.dart';
import 'package:star_rating/star_rating.dart';
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
          BookImage(image: MyImages.loadingImage, index: 1, size: 200,percent: .8,),
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
