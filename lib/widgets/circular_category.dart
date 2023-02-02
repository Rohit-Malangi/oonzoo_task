import 'package:flutter/material.dart';
import 'package:oonzoo_app/data/dummy_data.dart';

import './circle_widget.dart';
import '../models/product.dart';

class CircularCategory extends StatefulWidget {
  const CircularCategory({super.key});

  @override
  State<CircularCategory> createState() => _CircularCategoryState();
}

class _CircularCategoryState extends State<CircularCategory> {
  List<ProductModel> product = [];

  @override
  void initState() {
    product = getCircularCategory;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                "All Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(onPressed: () => {}, child: const Text("View all")),
          ],
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: product.length,
            itemBuilder: (context, index) {
              return CircleWidget(
                  imageUrl: product[index].imageUrl,
                  productName: product[index].productName);
            },
          ),
        ),
      ],
    );
  }
}
