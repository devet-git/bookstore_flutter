// ignore_for_file: avoid_print

import 'package:book_app/services/user_service.dart';
import 'package:book_app/services/book_service.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int bookid = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              UserService().getAll((data) => {print(data[0]["role"])});
            },
            child: const Text("get 1 data"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                bookid += 1;
              });
              BookService().add(
                title: "this is book $bookid",
                status: "publish",
                longDescription: "longDescription $bookid",
                sortDescription: "sortDescription $bookid",
                authors: ["a", "b"],
                categories: ["cate $bookid"],
              );
            },
            child: const Text("ADD BOOK"),
          )
        ],
      ),
    );
  }
}
