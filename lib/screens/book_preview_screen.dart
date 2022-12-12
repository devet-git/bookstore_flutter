import 'dart:ui';
import 'package:book_app/components/my_box.dart';
import 'package:book_app/components/my_button.dart';
import 'package:book_app/helpers/app_colors.dart';
import 'package:book_app/helpers/change_screen.dart';
import 'package:book_app/helpers/gen_edge_insets.dart';
import 'package:book_app/screens/reading_screen.dart';
import 'package:book_app/services/auth_service.dart';
import 'package:book_app/services/user_service.dart';
import 'package:flutter/material.dart';

class BookPreviewScreen extends StatefulWidget {
  const BookPreviewScreen({super.key, required this.book});
  final dynamic book;
  @override
  State<BookPreviewScreen> createState() => _BookPreviewScreenState();
}

class _BookPreviewScreenState extends State<BookPreviewScreen> {
  bool click = true;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookData = widget.book;
    if (mounted) {
      // BookService().getAll((data) {
      //   setState(() {});
      // });
    }
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
      child: Scaffold(
        appBar: appBar(bookData, context),
        body: body(bookData, context),
      ),
    );
  }

  SingleChildScrollView body(bookData, BuildContext context) {
    var bookCover = Center(
      child: Padding(
        padding: genEdgeInsets([5, 70, 0]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset("assets/images/book-cover.jpg"),
        ),
      ),
    );
    var bookTitle = Transform.translate(
      offset: const Offset(0.0, 0.0),
      child: Text(
        bookData["title"],
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
    var authorAndAction = MyBox(
      style: MyBoxStyle(
        backColor: Colors.blue.shade50,
        padding: [5],
        margin: [10, 0, 20],
        borderRadius: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "By ${bookData['authors'].join(', ')}",
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          MyButton(
            bookData['price'] == 0 ? "Read now" : "Buy now",
            style: MyButtonStyle(
              color: bookData['price'] == 0 ? Colors.blue : Colors.green,
              backColor:
                  bookData['price'] == 0 ? Colors.blue[100] : Colors.green[100],
              borderRadius: 7,
              padding: [0, 10],
            ),
            onPressed: () {
              // if (bookData['price'] != 0) {
              //   ChangeScreen.nextScreen(
              //       context, const ReadingScreen());
              // }
              ChangeScreen.nextScreen(
                  context,
                  ReadingScreen(
                    chapters: bookData['chapters'],
                  ));
            },
          ),
        ],
      ),
    );

    // ignore: unused_local_variable
    var categories = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Categories: ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        for (var cate in bookData['categories'])
          MyButton(
            cate,
            style: MyButtonStyle(
              backColor: AppColors.random(),
              color: Colors.white,
              padding: [0, 10],
              margin: [0, 5],
              borderRadius: 5,
            ),
            onPressed: () {},
          ),
      ],
    );
    //
    return SingleChildScrollView(
      child: MyBox(
        style: MyBoxStyle(
          borderRadius: 10,
          backColor: Colors.white,
          // margin: [13, 10],
          padding: [10, 0, 0],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bookCover,
            MyBox(
              style: MyBoxStyle(padding: [10, 15]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  bookTitle,
                  authorAndAction,
                  // categories,
                  const Text(
                    "Mô tả",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      inherit: true,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    bookData['longDescription'],
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar(bookData, BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      elevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[AppColors.primary!, Colors.white],
          ),
        ),
      ),
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(0),
      //     topRight: Radius.circular(0),
      //   ),
      // ),
      leading: IconButton(
        icon: const Icon(
          Icons.close,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        if (AuthService().currentUser() != null)
          IconButton(
            icon: const Icon(
              Icons.bookmark_add_outlined,
              color: Colors.black,
            ),
            onPressed: () =>
                UserService().update2(AuthService().currentUser()!.uid, {
              'favoriteBooks': [bookData]
            }),
          ),
      ],
    );
  }
}
