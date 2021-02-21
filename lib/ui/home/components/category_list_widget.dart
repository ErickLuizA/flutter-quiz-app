import 'package:flutter/material.dart';

import 'package:Queszz/domain/entities/category.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryListWidget extends StatelessWidget {
  final List<Category> categoryList;

  const CategoryListWidget({
    Key key,
    @required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          categoryList.length,
          (index) {
            final category = categoryList[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/levels',
                  arguments: {"category": category},
                );
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/${category.image}.svg",
                    width: MediaQuery.of(context).size.width / 2.5,
                  ),
                  Text(
                    category.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
