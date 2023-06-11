import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, left: 10, top: 20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ReadMoreText(
          text,
          delimiter: ' ',
          trimMode: TrimMode.Line,
          trimLines: 7,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withOpacity(.85),
          ),
          trimExpandedText: ' أقل',
          trimCollapsedText: 'المزيد...',
          moreStyle: style,
          lessStyle: style,
        ),
      ),
    );
  }
}

const TextStyle style = TextStyle(
  fontSize: 19,
  color: Colors.cyanAccent,
  fontWeight: FontWeight.w600,
);
