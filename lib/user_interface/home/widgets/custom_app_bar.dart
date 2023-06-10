import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/utils/my_colors.dart';
import 'package:library_app/utils/my_icons.dart';
import 'package:library_app/utils/my_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: SvgPicture.asset(
            MyIcons.kSearchIcon,
            width: 35,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'روايات',
                style: MyStyles.textStyle26,
              ),
              TextSpan(
                text: ' وكتب',
                style: MyStyles.textStyle26.copyWith(color: MyColors.lightPink),
              ),
            ],
          ),
        ),
        const Icon(Icons.menu, size: 40)
      ],
    );
  }
}
