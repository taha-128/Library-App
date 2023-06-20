import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/utils/my_colors.dart';

class SimpleBottomSheet extends StatelessWidget {
  const SimpleBottomSheet({super.key, required this.screens});
  final List<Map<String, dynamic>> screens;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.only(top: 15),
      color: MyColors.black,
      child: ListView.builder(
        reverse: true,
        itemExtent: MediaQuery.of(context).size.width / screens.length,
        itemCount: screens.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SimpleBottomSheetItem(
            screen: screens[index],
            screens: screens,
          );
        },
      ),
    );
  }
}

class SimpleBottomSheetItem extends StatelessWidget {
  const SimpleBottomSheetItem({
    super.key,
    required this.screen,
    required this.screens,
  });
  final List<Map<String, dynamic>> screens;
  final Map<String, dynamic> screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        screen['opened'] = true;
        for (var item in screens) {
          if (item['title'] != screen['title']) {
            item['opened'] = false;
          }
        }
       
      },
      child: Column(
        children: [
          SvgPicture.asset(
            screen['icon'],
            height: 30,
            // ignore: deprecated_member_use
            color: screen['opened'] ? Colors.white : Colors.grey,
          ),
          const SizedBox(height: 3),
          Text(
            screen['title'],
            style: TextStyle(
              fontSize: 15,
              color: screen['opened'] ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
