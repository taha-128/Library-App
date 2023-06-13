import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/model/book_model.dart';
import 'package:library_app/logic/cubit/books_cubit.dart';
import 'center_section.dart';
import 'custom_app_bar.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);
  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        width: double.infinity,
        height: double.infinity,
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomAppBar(),
              SizedBox(height: 30),
              CenterSection(),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
