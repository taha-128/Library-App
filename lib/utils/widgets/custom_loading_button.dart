
import 'package:flutter/cupertino.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../my_styles.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    super.key,
    required this.show,
    required this.btnController,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.width,
  });

  final bool show;
  final LoadingButtonController btnController;
  final void Function() onPressed;
  final String text;
  final Color color;
  final double width;
  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      width: width,
      showBox: show,
      primaryColor: color,
      onPressed: onPressed,
      controller: btnController,
      child: Text(
        text,
        style: MyStyles.textStyle26.copyWith(letterSpacing: 1.5),
      ),
    );
  }
}
