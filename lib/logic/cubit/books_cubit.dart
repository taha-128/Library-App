import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/api/books_api.dart';
import 'package:library_app/data/repository/books_repository.dart';

import '../../data/model/book_model.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());
  late List<Book> books;

  Future<List<Book>> getAllBooks() async {
    books = await BooksRepository(booksApi: BooksApi()).getAllCharacters();
    emit(BooksLoaded(books: books));
    return books;
  }
}
