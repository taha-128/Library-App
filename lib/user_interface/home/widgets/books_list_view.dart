import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/model/book_model.dart';
import '../../../logic/home_cubit/books_cubit.dart';
import 'books_list_view_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({Key? key, required this.books}) : super(key: key);
  final List<Book> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: books.length,
            reverse: true,
            itemExtent: 160,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return BooksListViewItem(
                book: Book(
                  title: books[i].title,
                  author: books[i].author,
                  bookPages: books[i].bookPages,
                  category: books[i].category,
                  description: books[i].description,
                  downloadingLink: books[i].downloadingLink,
                  moreBooks: books[i].moreBooks,
                  pdfSize: books[i].pdfSize,
                  puplishingDate: books[i].puplishingDate,
                  rating: books[i].rating,
                  thumbnail: books[i].thumbnail,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
