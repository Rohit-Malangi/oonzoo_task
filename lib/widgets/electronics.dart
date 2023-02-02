import 'package:flutter/material.dart';
import 'package:oonzoo_app/data/dummy_data.dart';

import './box_tile.dart';
import '../models/product.dart';

class ElectronicsWidget extends StatefulWidget {
  const ElectronicsWidget({super.key});

  @override
  State<ElectronicsWidget> createState() => _ElectronicsWidgetState();
}

class _ElectronicsWidgetState extends State<ElectronicsWidget> {
  List<ProductModel> product = [];

  @override
  void initState() {
    product = getElectronics;
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
                "Electronics",
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
              return BoxTile(
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
