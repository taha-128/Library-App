import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:library_app/data/model/book_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      begin: 1,
      end: .97,
      child: MaterialButton(
        onPressed: () {
          FileDownloader.downloadFile(
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
        },
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
