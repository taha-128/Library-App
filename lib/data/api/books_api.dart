import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const String baseUrl =
    'https://firebasestorage.googleapis.com/v0/b/my-password-app-708ec.appspot.com/o/library_api.json?alt=media&token=a2dd72b4-4692-435f-af42-f0e4eb6188c8';

class BooksApi {
  late Dio dio = Dio();

  Future<List> getAllBooks() async {
    try {
      Response response = await dio.get(baseUrl);
      if (response.data['status'] == 'success') {
        return response.data['books'];
      }
      return [];
    } catch (e) {
      debugPrint("Exception : $e");
      return [];
    }
  }
}
