part of 'books_cubit.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoaded extends BooksState {
  BooksLoaded({required this.books, required this.categories});
  final List<Book> books;
  final List<String> categories;
}

class CategoriesChanged extends BooksState {
  CategoriesChanged({ required this.category, required this.books});
  final String category;

  final List<Book> books;
}
