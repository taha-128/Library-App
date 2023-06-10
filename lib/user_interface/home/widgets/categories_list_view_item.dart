import 'package:flutter/material.dart';
import 'package:library_app/constants/styles.dart';

import '../../../constants/colors.dart';

class CategoriesListViewItem extends StatelessWidget {
  const CategoriesListViewItem(
      {super.key, required this.text, required this.isSelected});
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: isSelected ? MyColors.purple : MyColors.black,
        splashColor: isSelected ? MyColors.black : MyColors.purple,
        height: 15,
        onPressed: () {},
        child: Text(
          text,
          style: Styles.textStyle18,
        ),
      ),
    );
  }
}
