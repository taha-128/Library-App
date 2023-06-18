import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/model/book_model.dart';
import 'package:library_app/logic/cubit/books_cubit.dart';

import 'widgets/center_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Book> books;

  @override
  void initState() {
    BlocProvider.of<BooksCubit>(context).getAllBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 18),
        width: double.infinity,
        height: double.infinity,
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CenterSection(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
