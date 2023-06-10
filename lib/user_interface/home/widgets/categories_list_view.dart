import 'package:flutter/material.dart';

import 'categories_list_view_item.dart';


class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    bool b1 = true;
    bool b2 = false;
    bool b3 = false;
    bool b4 = false;
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ListView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          CategoriesListViewItem(
            text: 'جميع الكتب',
            isSelected: b1,
          ),
          CategoriesListViewItem(
            text: 'رياضيات',
            isSelected: b2,
          ),
          CategoriesListViewItem(
            text: 'نظام الحاسوب',
            isSelected: b3,
          ),
          CategoriesListViewItem(
            text: 'علوم الحاسوب',
            isSelected: b4,
          ),
        ],
      ),
    );
  }
}