import 'package:book_app/helpers/app_sizes.dart';
import 'package:book_app/helpers/gen_edge_insets.dart';
import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/blur.jpg"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [top3(), topless(context)],
        ),
      ),
    );
  }

  Widget topless(BuildContext context) {
    return Container(
      height: AppSizes.deviceSize(context).height - 75,
      padding: genEdgeInsets([20, 5, 5]),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView(children: [
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/images/book-cover.jpg",
              height: 100,
            ),
            title: const Text("book no.1"),
            subtitle: const Text("Lượt xem: 1000000"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/images/book-cover.jpg",
              height: 100,
            ),
            title: const Text("book no.1"),
            subtitle: const Text("Lượt xem: 1000000"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/images/book-cover.jpg",
              height: 100,
            ),
            title: const Text("book no.1"),
            subtitle: const Text("Lượt xem: 1000000"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/images/book-cover.jpg",
              height: 100,
            ),
            title: const Text("book no.1"),
            subtitle: const Text("Lượt xem: 1000000"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/images/book-cover.jpg",
              height: 100,
            ),
            title: const Text("book no.1"),
            subtitle: const Text("Lượt xem: 1000000"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/images/book-cover.jpg",
              height: 100,
            ),
            title: const Text("book no.1"),
            subtitle: const Text("Lượt xem: 1000000"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/images/book-cover.jpg",
              height: 100,
            ),
            title: const Text("book no.1"),
            subtitle: const Text("Lượt xem: 1000000"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/images/book-cover.jpg",
              height: 100,
            ),
            title: const Text("book no.1"),
            subtitle: const Text("Lượt xem: 1000000"),
          ),
        ),
      ]),
    );
  }

  Container top3() {
    return Container(
      padding: genEdgeInsets([15, 20]),
      child: Column(children: [
        const Card(
          child: ListTile(
            leading: Icon(Icons.looks_one_outlined),
            title: Text("book no.1"),
            subtitle: Text("Lượt xem: 1000000"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/images/book-cover.jpg",
            ),
            title: const Text("book no.1"),
            subtitle: const Text("Lượt xem: 1000000"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/images/book-cover.jpg",
              height: 100,
            ),
            title: const Text("book no.1"),
            subtitle: const Text("Lượt xem: 1000000"),
          ),
        ),
      ]),
    );
  }
}
