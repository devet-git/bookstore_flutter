import 'package:book_app/helpers/change_screen.dart';
import 'package:book_app/screens/book_preview_screen.dart';
import 'package:book_app/services/auth_service.dart';
import 'package:book_app/services/firestore_service.dart';
import 'package:book_app/services/storage_service.dart';
import 'package:flutter/material.dart';

class FavoriteBooksScreen extends StatefulWidget {
  const FavoriteBooksScreen({super.key});

  @override
  State<FavoriteBooksScreen> createState() => _FavoriteBooksScreenState();
}

class _FavoriteBooksScreenState extends State<FavoriteBooksScreen> {
  List? _data = [];
  String appBarTitle = "Favorite";
  bool isShowRecentBooks = false;
  String bookImgLink = "";

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      FirestoreService(collection: "users")
          .getDoc(AuthService().currentUser()!.uid, (data) {
        setState(() {
          _data = data['favoriteBooks'];
        });
      });
      StorageService(folder: "books").getImageUrl("book-cover2.jpg", (url) {
        setState(() {
          bookImgLink = url;
        });
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        elevation: 0,
        title: Text(
          appBarTitle,
          style: const TextStyle(color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                // Colors.green[200]!,
                Colors.yellow[200]!,
                Colors.white
              ],
            ),
          ),
        ),
        actions: [
          if (!isShowRecentBooks)
            IconButton(
              tooltip: "Select all",
              onPressed: () {},
              icon: const Icon(
                Icons.select_all,
                color: Colors.black,
              ),
            ),
          IconButton(
            onPressed: () {
              setState(() {
                appBarTitle = isShowRecentBooks ? "Favorite" : "Recently";
              });
              isShowRecentBooks = !isShowRecentBooks;
            },
            icon: Icon(
              isShowRecentBooks
                  ? Icons.favorite_border
                  : Icons.remove_red_eye_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: isShowRecentBooks ? showRecentBooks() : showFavoriteBooks(),
    );
  }

  Widget showRecentBooks() {
    return _data != null
        ? ListView(
            shrinkWrap: true,
            children: <Widget>[
              // const SizedBox(
              //   height: 20,
              // ),
              for (var book in _data!)
                Card(
                  child: ListTile(
                    leading: Image.asset("assets/images/book-cover2.jpg"),
                    title: Text(book['title']),
                    subtitle: Text("By ${book['authors'].join(', ')}"),
                    // trailing: const Icon(Icons.more_vert),
                    onTap: () => ChangeScreen.nextScreenAnimated(
                        context, BookPreviewScreen(book: book)),
                  ),
                ),
            ],
          )
        : const Text("Empty");
  }

  Widget showFavoriteBooks() {
    return _data != null
        ? ListView.builder(
            itemCount: _data!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.asset("assets/images/book-cover.jpg"),
                  title: Text(_data![index]['title']),
                  subtitle: Text("By ${_data![index]['authors'].join(', ')}"),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(child: Text("Remove")),
                    ],
                  ),
                  onTap: () => ChangeScreen.nextScreenAnimated(
                      context, BookPreviewScreen(book: _data![index])),
                ),
              );
            },
          )
        : const Text("Empty");
  }
}
