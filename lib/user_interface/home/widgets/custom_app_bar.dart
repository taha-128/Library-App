import 'package:flutter/material.dart';
import 'package:library_app/constants/colors.dart';

import '../../../constants/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          splashColor: MyColors.background,
          icon: const Icon(Icons.search, size: 40),
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'روايات',
                style: Styles.textStyle26,
              ),
              TextSpan(
                text: ' وكتب',
                style: Styles.textStyle26.copyWith(color: MyColors.lightPink),
              ),
            ],
          ),
        ),
        const Icon(Icons.menu, size: 40)
      ],
    );
  }
}
