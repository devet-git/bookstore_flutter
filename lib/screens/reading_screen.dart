import 'package:flutter/material.dart';

import '../helpers/gen_edge_insets.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key, required this.chapters});
  final List chapters;
  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  int chapterIndex = 0;
  bool isShowAppBar = true;
  double fontSize = 20;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final bookChatpers = widget.chapters;
    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false, // Prevent user sliding open
      endDrawer: Drawer(
        child: ListView.builder(
          itemCount: bookChatpers.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(
                  "Chapter ${index + 1}: ${bookChatpers[index]['title']}",
                ),
                leading: const Icon(Icons.numbers),
                onTap: () => setState(() {
                  chapterIndex = index;
                }),
              )),
        ),
      ),
      appBar: isShowAppBar ? appBar(context) : null,
      body: body(bookChatpers),
    );
  }

  GestureDetector body(List<dynamic> bookChatpers) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShowAppBar = !isShowAppBar;
        });
      },
      //add swipe event
      onHorizontalDragUpdate: (details) {
        // Note: Sensitivity is integer used when you don't want to mess up vertical drag
        int sensitivity = 8;
        if (details.delta.dx > sensitivity) {
          // Right Swipe
          setState(() {
            if (chapterIndex - 1 >= 0) chapterIndex -= 1;
          });
        } else if (details.delta.dx < -sensitivity) {
          //Left Swipe
          setState(() {
            if (chapterIndex + 1 < bookChatpers.length) chapterIndex += 1;
          });
        }
      },
      child: Container(
          padding: genEdgeInsets([10]),
          child: ListView(
            children: [
              Text(
                "Chapter ${chapterIndex + 1}: ${bookChatpers[chapterIndex]['title']}",
                style: TextStyle(
                  fontSize: fontSize + 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: genEdgeInsets([10, 0, 0]),
                child: Text(
                  bookChatpers[chapterIndex]['content'],
                  style: TextStyle(
                    height: 1.25,
                    wordSpacing: 2,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      // scrolledUnderElevation: 10,
      elevation: 0,
      backgroundColor: Colors.white,
      // toolbarHeight: 35,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.blue[100]!, Colors.white],
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context)
          ..pop()
          ..pop(),
      ),
      actions: [
        IconButton(
          onPressed: () => setState(() {
            fontSize = fontSize - 1 >= 12 ? fontSize - 1 : fontSize;
          }),
          icon: const Icon(Icons.keyboard_double_arrow_down),
        ),
        IconButton(
          onPressed: () => setState(() {
            fontSize = fontSize + 1 <= 30 ? fontSize + 1 : fontSize;
          }),
          icon: const Icon(Icons.keyboard_double_arrow_up),
        ),
        IconButton(
          onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
          icon: const Icon(Icons.list),
        )
      ],
      // title: const Text("Book Title"),
    );
  }
}
