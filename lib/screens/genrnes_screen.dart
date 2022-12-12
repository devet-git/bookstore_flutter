import 'package:book_app/helpers/app_colors.dart';
import 'package:book_app/helpers/gen_edge_insets.dart';
import 'package:flutter/material.dart';

final List<String> categories = [
  "Tình cảm",
  "Trinh Thám",
  "Kiếm hiệp",
  "Kinh Doanh",
  "Hài hước",
  "Tình cảm",
];

class GernesScreen extends StatelessWidget {
  const GernesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: genEdgeInsets([5, 20]),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 2,
          ),
          itemCount: categories.length,
          itemBuilder: (_, int index) {
            return Card(
              color: AppColors.random(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[AppColors.random(), AppColors.random()],
                  ),
                ),
                child: ListTile(
                  title: Text(
                    categories[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    "14 sách",
                    style: TextStyle(
                      color: Color.fromARGB(255, 231, 231, 231),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
