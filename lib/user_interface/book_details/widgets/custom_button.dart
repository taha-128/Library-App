import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:library_app/data/model/book_model.dart';
import 'package:library_app/utils/widgets/custom_loading_button.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    LoadingButtonController btnController = LoadingButtonController();
    bool show = true;

    Future<void> downloadingFunc() async {
      await FileDownloader.downloadFile(
        url: book.downloadingLink,
        name: '${book.title}.pdf',
        onDownloadCompleted: (path) {
          AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: 0,
              channelKey: 'basic_channel',
              actionType: ActionType.Default,
              title: 'لا تنسى الصلاة على الحبيب، ستجد الكتاب هنا',
              body: path,
            ),
          );
        },
      );
    }

    return CustomLoadingButton(
      show: show,
      btnController: btnController,
      onPressed: () {
        Future.delayed(
          const Duration(seconds: 2),
          () async {
            await downloadingFunc();
            btnController.success();
            Future.delayed(const Duration(seconds: 1), () {
              btnController.reset();
            });
          },
        );
      },
      text: 'تحميل',
      color: const Color.fromARGB(255, 144, 64, 224),
      width: width * .82,
    );
  }
}
