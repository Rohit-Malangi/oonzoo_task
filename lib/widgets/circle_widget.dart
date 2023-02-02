import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget(
      {super.key, required this.imageUrl, required this.productName});

  final String imageUrl, productName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              productName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
