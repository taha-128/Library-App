import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/api/books_api.dart';
import 'package:library_app/data/repository/books_repository.dart';
import '../../data/model/book_model.dart';
import '../../main.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  late List<Book> books;

  late List<Book> showedBooks = books;

  List<String> favouriteBooksTitles = prefs.getStringList('favorites') ?? [];

  late List<Book> favouriteBooks =
      books.where((book) => favouriteBooksTitles.contains(book.title)).toList();

  late List<String> booksForSearch = books.map((book) => book.title).toList();

  List<String> categories = ['جميع الكتب'];

  String category = 'جميع الكتب';

  Future<List<Book>> getAllBooks() async {
    books = await BooksRepository(booksApi: BooksApi()).getAllBooks();
    categories = await getCategories();
    favouriteBooksTitles = prefs.getStringList('favorites') ?? [];
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

  void deleteBook(BuildContext context, {required Book book}) {
    favouriteBooksTitles.remove(book.title);
    favouriteBooks.remove(book);
    prefs.setStringList('favorites', favouriteBooksTitles);
    showSnackBar(
      color: Colors.red,
      text: 'تمت الازالة من مكتبتك',
      context: context,
    );
    emit(DeleteBook(books: favouriteBooks));
  }

  Future<void> addToFavourites(
      {required Book book, required BuildContext context}) async {
    if (favouriteBooksTitles.contains(book.title)) {
      showSnackBar(
        color: Colors.green,
        text: 'الكتاب في مكتبتك بالفعل',
        context: context,
      );
      return;
    }
    favouriteBooksTitles.add(book.title);
    favouriteBooks.add(book);
    prefs.setStringList('favorites', favouriteBooksTitles);
    showSnackBar(
      color: Colors.green,
      text: 'تمت الإضافة إلى مكتبتك',
      context: context,
    );
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
