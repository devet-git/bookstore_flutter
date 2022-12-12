import 'package:book_app/services/book_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  List _data = [];
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      BookService().getAll((data) {
        setState(() {
          _data = data;
        });
      });
    }
    return GridView.count(
      childAspectRatio: 0.72,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (var book in _data)
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, itemPage),
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 42,
                    child: Text(
                      book['title'],
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(book['sortDescription'],
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "\$55",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      ),
                      Icon(
                        CupertinoIcons.add_circled,
                        color: Color(0xFF475269),
                        size: 28,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
