import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      begin: 1,
      end: .97,
      child: MaterialButton(
        onPressed: () {},
        minWidth: 350,
        height: 55,
        splashColor: Colors.purple,
        color: const Color.fromARGB(255, 144, 64, 224),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          'تحميل',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
        ),
      ),
    );
  }
}
