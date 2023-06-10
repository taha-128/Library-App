import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:library_app/utils/my_icons.dart';
import 'package:share_plus/share_plus.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Share.shareXFiles([XFile('download url')]);
              },
              child: SvgPicture.asset(
                MyIcons.kShareIcon,
                width: 28,
              ),
            ),
            const SizedBox(width: 14),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                MyIcons.kBookmarkIcon,
                width: 28,
              ),
            ),
          ],
        ),
        Text(
          'الأب الغني والأب الفقير',
          style: TextStyle(fontSize: 20),
        ),
        const Icon(
          Icons.menu,
          size: 30,
          color: Color(0xFFff00dd),
        )
      ],
    );
  }
}