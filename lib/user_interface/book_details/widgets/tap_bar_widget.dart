import 'package:flutter/material.dart';
import 'package:library_app/utils/my_colors.dart';
import 'package:library_app/utils/my_styles.dart';

class MyTapBar extends StatelessWidget {
  const MyTapBar({super.key, this.controller});
  final TabController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TabBar(
        isScrollable: false,
        unselectedLabelColor: Colors.white,
        indicatorColor: MyColors.purple,
        labelColor: MyColors.purple,
        tabs: [
          Text(
            'روابط',
            style: MyStyles.textStyle26.copyWith(fontWeight: FontWeight.w400),
          ),
          Text(
            'نبذة',
            style: MyStyles.textStyle26.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
