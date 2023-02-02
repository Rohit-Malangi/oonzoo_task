import 'package:flutter/material.dart';
import 'package:oonzoo_app/data/dummy_data.dart';
import 'package:oonzoo_app/widgets/product_tile.dart';

import '../models/product.dart';

class RecommandWidget extends StatefulWidget {
  const RecommandWidget({super.key});

  @override
  State<RecommandWidget> createState() => _RecommandWidgetState();
}

class _RecommandWidgetState extends State<RecommandWidget> {
  List<ProductModel> product = [];

  @override
  void initState() {
    product = getCategerious;
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
                "Recommended for you",
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
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: product.length,
            itemBuilder: (context, index) {
              return ProductTile(
                imageUrl: product[index].imageUrl,
                productName: product[index].productName,
              );
            },
          ),
        ),
      ],
    );
  }
}
