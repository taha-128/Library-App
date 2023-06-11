// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'custom_app_bar.dart';
import 'custom_button.dart';
import 'my_text_widget.dart';
import 'tap_bar_widget.dart';
import 'upper_section.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 35),
              UpperSection(),
              SizedBox(height: 30),
              BottomSection(),
              CustomButton()
            ],
          ),
        ),
      ),
    );
  }
}


class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 320,
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MyTapBar(),
            SizedBox(
              height: 270,
              width: double.infinity,
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  MyTextWidget(text: 'رابط الكتاب'),
                  MyTextWidget(text: 'test'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
