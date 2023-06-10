// ignore_for_file: prefer_const_constructors
//! Reomve this line ^

import 'package:flutter/material.dart';
import 'custom_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
