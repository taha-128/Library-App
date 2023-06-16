part of 'books_cubit.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoaded extends BooksState {
  BooksLoaded({required this.books, required this.categories});
  final List<Book> books;
  final List<String> categories;
}

class CategoryChanged extends BooksState {
  CategoryChanged({required this.books});
  final List<Book> books;
}
