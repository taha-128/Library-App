import 'package:flutter/material.dart';
import 'package:library_app/data/model/book_model.dart';
import 'my_text_widget.dart';
import 'tap_bar_widget.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 320,
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const MyTapBar(),
            SizedBox(
              height: 270,
              width: double.infinity,
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  MyTextWidget(text: 'الكاتب لا يملك كتب أخرى'),
                  MyTextWidget(text: book.description!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
