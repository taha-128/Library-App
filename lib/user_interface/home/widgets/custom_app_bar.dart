import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/utils/my_colors.dart';
import 'package:library_app/utils/my_icons.dart';
import 'package:library_app/utils/my_styles.dart';
import 'my_search_field.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

bool isSearching = false;

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return isSearching
        ? MySearchField(controller: controller)
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  isSearching = true;
                  ModalRoute.of(context)?.addLocalHistoryEntry(
                    LocalHistoryEntry(
                      onRemove: () {
                        isSearching = false;
                      },
                    ),
                  );
                },
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
                      style: MyStyles.textStyle26
                          .copyWith(color: MyColors.lightPink),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.menu, size: 40)
            ],
          );
  }
}
