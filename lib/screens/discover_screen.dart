import 'package:book_app/components/book_show.dart';
import 'package:book_app/helpers/app_colors.dart';
import 'package:book_app/helpers/change_screen.dart';
import 'package:book_app/helpers/gen_edge_insets.dart';
import 'package:book_app/screens/book_preview_screen.dart';
import 'package:book_app/services/firestore_service.dart';
import 'package:flutter/material.dart';

import '../components/image_slide_show.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List _bookData = [];
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      FirestoreService(collection: "books").getAllDocs((data) {
        setState(() {
          _bookData = data;
        });
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: const Text(
        //   "Rebo ebook",
        //   style: TextStyle(color: Colors.black),
        // ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[AppColors.primary!, Colors.white],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: genEdgeInsets([15, 0, 0]),
            child: const MyImageSlideShow(
              imageLinks: [
                "assets/images/book-cover.jpg",
                "assets/images/book-cover2.jpg",
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            // decoration: const BoxDecoration(
            //   color: Color(0xFFEDECF2),
            // ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 10, bottom: 0),
                    child: const Text(
                      "Bestseller Book",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                  ),
                  const Text("hehe"),
                ],
              ),
              // const BookList(),
              SizedBox(
                // width: AppSizes.deviceSize(context).width,
                height: 250,
                child: ListView(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var book in _bookData)
                      Padding(
                        padding: genEdgeInsets([0, 10]),
                        child: MyBookShow.style1(
                            title: book['title'],
                            description: book['sortDescription'],
                            price: book['price'],
                            onTap: () {
                              ChangeScreen.nextScreenAnimated(
                                  context, BookPreviewScreen(book: book));
                            }),
                      ),
                    MyBookShow.style1(
                      title: "hihi",
                      description: "hahaahha",
                      price: 100,
                      onTap: () {},
                    ),
                    MyBookShow.style1(
                      title: "hihi",
                      description: "hahaahha",
                      price: 100,
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Bi mat Phan Thien An',
    'Con duoc la chinh minh',
    'Cay cam ngot cua toi',
    'Hanh tinh cua mot ke nghi nhieu',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var books in searchTerms) {
      if (books.toLowerCase().contains(query.toUpperCase())) {
        matchQuery.add(books);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var books in searchTerms) {
      if (books.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(books);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
