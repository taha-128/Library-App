import 'package:library_app/data/api/books_api.dart';
import 'package:library_app/data/model/book_model.dart';

class BooksRepository {
  final BooksApi booksApi;

  BooksRepository({required this.booksApi});

  Future<List<Book>> getAllCharacters() async {
    final books = await BooksApi().getAllBooks();

    return books.map((book) => Book.fromJson(book)).toList();
  }
}
