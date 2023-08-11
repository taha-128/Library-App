import 'package:flutter/material.dart';
import 'package:library_app/utils/my_styles.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoadingButtonController btnController1 = LoadingButtonController();
    LoadingButtonController btnController2 = LoadingButtonController();
    LoadingButtonController btnController3 = LoadingButtonController();
    LoadingButtonController btnController4 = LoadingButtonController();
    bool show1 = true;
    bool show2 = true;
    bool show3 = true;
    bool show4 = true;

    void launchCustomUrl(String url, LoadingButtonController controller) {
      Future.delayed(
        const Duration(seconds: 2),
        () async {
          controller.success();
          try {
            Uri urlLink = Uri.parse(url);
            if (await canLaunchUrl(urlLink)) {
              await launchUrl(urlLink);
            } else {
              throw 'Could not launch $urlLink';
            }
          } catch (e) {
            debugPrint('E: $e');
          }
          Future.delayed(const Duration(seconds: 1), () {
            controller.reset();
          });
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const ClipOval(
                  child: Material(
                    child: Image(
                      width: 220,
                      image: NetworkImage(
                        'https://avatars.hsoubcdn.com/f9b11714a00e33ddb0eb0029c0f3fbe4?s=256',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                CustomLoadingButton(
                  width: 320,
                  onPressed: () {
                    launchCustomUrl(
                        'https://mostaql.com/u/taha128', btnController1);
                  },
                  show: show1,
                  btnController: btnController1,
                  text: 'اطلب تطبيق خاص بك',
                  color: const Color(0xFF068FFF),
                ),
                const SizedBox(height: 30),
                CustomLoadingButton(
                  width: 310,
                  onPressed: () {
                    launchCustomUrl(
                        'https://github.com/taha-128', btnController2);
                  },
                  show: show2,
                  btnController: btnController2,
                  text: 'Github حسابي على',
                  color: const Color(0xFF6528F7),
                ),
                const SizedBox(height: 30),
                CustomLoadingButton(
                  width: 300,
                  onPressed: () {
                    launchCustomUrl(
                      'https://www.facebook.com/profile.php?id=100055747885038',
                      btnController3,
                    );
                  },
                  show: show3,
                  btnController: btnController3,
                  text: 'Facebook حسابي على',
                  color: const Color(0xFFA076F9),
                ),
                const SizedBox(height: 30),
                CustomLoadingButton(
                  width: 290,
                  onPressed: () {
                    launchCustomUrl(
                      'https://wa.me/+201033527637',
                      btnController4,
                    );
                  },
                  show: show4,
                  btnController: btnController4,
                  text: 'تواصل معي واتس',
                  color: const Color.fromARGB(233, 0, 231, 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
