import 'package:flutter/material.dart';
import 'categories_list_view_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.categories});
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length - 2,
      child: TabBar(
        isScrollable: false,
        automaticIndicatorColorAdjustment: false,
        unselectedLabelColor: Colors.white,
        indicatorColor: Colors.transparent,
        tabs: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              reverse: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoriesListViewItem(
                  text: categories[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
