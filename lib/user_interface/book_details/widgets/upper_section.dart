import 'package:flutter/material.dart';
import 'package:star_rating/star_rating.dart';

import '../../../data/model/book_model.dart';
import '../../../utils/my_styles.dart';
import '../../home/widgets/book_image.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({super.key, required this.book});
  final Book book;
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
              Text('المؤلف : ${book.author}', style: MyStyles.textStyle18),
              Text('عدد الصفحات : ${book.bookPages}',
                  style: MyStyles.textStyle18),
              Text('${book.puplishingDate} : تاريخ النشر',
                  style: MyStyles.textStyle18),
              StarRating(
                color: Colors.yellow,
                starSize: 20,
                between: 4,
                length: 5,
                rating: book.rating.toDouble(),
              ),
            ],
          ),
        ),
        const SizedBox(width: 14),
        BookImage(
          book: book,
          percent: .72,
          push: false,
          size: 250,
        ),
      ],
    );
  }
}
