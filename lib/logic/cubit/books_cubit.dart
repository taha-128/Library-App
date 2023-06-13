import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/api/books_api.dart';
import 'package:library_app/data/repository/books_repository.dart';

import '../../data/model/book_model.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  late List<Book> books;
  late List<Book> showedBooks = books;
  List<String> categories = ['جميع الكتب'];
  String category = 'جميع الكتب';

  Future<List<Book>> getAllBooks() async {
    books = await BooksRepository(booksApi: BooksApi()).getAllCharacters();
    categories = await getCategories();
    emit(BooksLoaded(books: showedBooks, categories: categories));
    return books;
  }

  Future<List<String>> getCategories() async {
    for (int i = books.length - 1; i != -1; i--) {
      String category = books[i].category!;
      if (!categories.contains(category)) {
        categories.add(category);
      }
    }
    return categories;
  }

  Future<void> changeShowedBooks(String? category) async {
    if (category == 'جميع الكتب') {
      showedBooks = books;
    } else {
      showedBooks = books.where((book) => book.category == category).toList();
    }
    this.category = category ?? 'جميع الكتب';
    emit(
      CategoriesChanged(category: category ?? 'جميع الكتب', books: showedBooks),
    );
    // emit(BooksLoaded(books: books, categories: categories));
  }
}
