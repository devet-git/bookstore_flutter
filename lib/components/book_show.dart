// ignore_for_file: prefer_const_constructors

import 'package:book_app/components/my_box.dart';

import 'package:flutter/material.dart';

class MyBookShow {
  static Widget style1({
    required String title,
    String? description,
    int? price,
    Function? onTap,
  }) {
    return Tooltip(
      message: title,
      child: Card(
        child: InkWell(
          onTap: () => onTap!(),
          child: Column(
            children: [
              Image.asset(
                "assets/images/book-cover.jpg",
                height: 160,
                // width: 120,
              ),
              Container(
                alignment: Alignment.centerLeft,
                // height: 42,
                width: 150,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // Text("hahsdsfa"),
                    price == 0
                        ? MyBox(
                            style: MyBoxStyle(
                              backColor: Colors.green[300]!,
                              padding: [10],
                              borderRadius: 10,
                            ),
                            child: const Text(
                              "Free",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ))
                        : Text(
                            "$price.000",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                    // const Icon(
                    //   CupertinoIcons.add_circled,
                    //   color: Color(0xFF475269),
                    //   size: 28,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
