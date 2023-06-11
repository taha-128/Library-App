// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:library_app/user_interface/home/widgets/book_image.dart';
import 'package:library_app/utils/my_images.dart';
import 'package:star_rating/star_rating.dart';
import '../../../utils/my_styles.dart';
import 'custom_app_bar.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}

