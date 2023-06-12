import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const String baseUrl =
    'https://firebasestorage.googleapis.com/v0/b/my-password-app-708ec.appspot.com/o/arabic_books.json?alt=media&token=5f0c22bb-9fcb-41c5-b73e-452d6aa64b4c&_gl=1*10puqad*_ga*MTU1OTQ4NjU0MS4xNjU2Nzc0NjM3*_ga_CW55HF8NVT*MTY4NjUxMjYzMS40MC4xLjE2ODY1MTI2NjguMC4wLjA.';

class BooksApi {
  late Dio dio = Dio();

  Future<List> getAllBooks() async {
    try {
      Response response = await dio.get(baseUrl);
      if (kDebugMode) {
        print(response.data['books']);
      }
      return response.data['books'];
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}
