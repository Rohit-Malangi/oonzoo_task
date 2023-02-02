import 'package:flutter/material.dart';


class BoxTile extends StatelessWidget {
  const BoxTile({super.key, required this.imageUrl, required this.productName});

  final String imageUrl, productName;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            height: 180,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            productName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ],
      );
  }
}