// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'books_cubit.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoaded extends BooksState {
  BooksLoaded({required this.books});
  final List<Book> books;

}
