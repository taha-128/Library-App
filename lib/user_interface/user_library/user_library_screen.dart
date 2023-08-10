import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/logic/cubit/books_cubit.dart';
import 'package:library_app/utils/widgets/latest_book_widget.dart';

class UserLibraryScreen extends StatefulWidget {
  const UserLibraryScreen({super.key});

  @override
  State<UserLibraryScreen> createState() => _UserLibraryScreenState();
}

class _UserLibraryScreenState extends State<UserLibraryScreen> {
  @override
  void initState() {
    print(BlocProvider.of<BooksCubit>(context).favouriteBooksTitles);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BooksCubit, BooksState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount:
                  BlocProvider.of<BooksCubit>(context).favouriteBooks.length,
              padding: const EdgeInsets.only(top: 18),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: BookWidget(
                    book: BlocProvider.of<BooksCubit>(context)
                        .favouriteBooks[index],
                    onTap: () {
                      BlocProvider.of<BooksCubit>(context).deleteBook(
                        bookTitle: BlocProvider.of<BooksCubit>(context)
                            .favouriteBooksTitles[index],
                        context: context,
                      );
                      print(
                        BlocProvider.of<BooksCubit>(context)
                            .favouriteBooksTitles,
                      );
                    },
                    delete: true,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
