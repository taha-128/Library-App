import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import 'latest_book_widget.dart';

class LatestBooks extends StatelessWidget {
  const LatestBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'أحدث الإصدارات',
          style: Styles.textStyle26.copyWith(fontSize: 22),
        ),
        const SizedBox(height: 5),
        const LatestBookWidget(),
        const SizedBox(height: 15),
        const LatestBookWidget(),
      ],
    );
  }
}
