import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/api/books_api.dart';
import 'package:library_app/data/repository/books_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/model/book_model.dart';
import '../../main.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  late List<Book> books;

  late List<Book> showedBooks = books;

  List<String> favouriteBooksTitles = [];

  late List<Book> favouriteBooks =
      books.where((book) => favouriteBooksTitles.contains(book.title)).toList();

  // Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  late List<String> booksForSearch = books.map((book) => book.title).toList();

  List<String> categories = ['جميع الكتب'];

  String category = 'جميع الكتب';

  void getFavouriteBooks() async {
    favouriteBooksTitles = prefs.getStringList('favourtieBooks') ?? [];
  }

  Future<List<Book>> getAllBooks() async {
    books = await BooksRepository(booksApi: BooksApi()).getAllBooks();
    categories = await getCategories();
    getFavouriteBooks();
    emit(BooksLoaded(books: showedBooks, categories: categories));
    return books;
  }

  Future<List<String>> getCategories() async {
    for (int i = books.length - 1; i != -1; i--) {
      String category = books[i].category;
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
      CategoryChanged(books: showedBooks),
    );
  }

  void deleteBook(
      {required String bookTitle, required BuildContext context}) {
    favouriteBooksTitles.remove(bookTitle);
    showSnackBar(
      color: Colors.red,
      text: 'تمت الازالة من مكتبتك',
      context: context,
    );

    List<Book> favouriteBooks = books
        .where((book) => favouriteBooksTitles.contains(book.title))
        .toList();

    emit(state);
  }

  Future<void> addToFavourites(
      {required Book book, required BuildContext context}) async {
    if (favouriteBooksTitles.contains(book.title)) {
      showSnackBar(
        color: Colors.green,
        text: 'الكتاب في مكتبتك بالفعل',
        context: context,
      );
    } else {
      favouriteBooksTitles.add(book.title);
      showSnackBar(
        color: Colors.green,
        text: 'تمت الإضافة إلى مكتبتك',
        context: context,
      );
    }
    prefs.setStringList('favourtieBooks', favouriteBooksTitles);
    emit(state);
  }
}

void showSnackBar({
  required BuildContext context,
  required String text,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        text,
        style: const TextStyle(fontSize: 22, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 1),
    ),
  );
}
