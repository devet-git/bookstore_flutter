import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class MyImageSlideShow extends StatelessWidget {
  const MyImageSlideShow({Key? key, required this.imageLinks})
      : super(key: key);
  final List<String> imageLinks;
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 520,
      indicatorBackgroundColor: Colors.white,
      autoPlayInterval: 3000,
      isLoop: true,
      children: [
        for (var link in imageLinks)
          InkWell(
            child: Image.asset(link, fit: BoxFit.fitHeight),
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("HAHA")));
            },
          )
      ],
    );
  }
}
