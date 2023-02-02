import 'package:flutter/material.dart';
import 'package:oonzoo_app/data/dummy_data.dart';

class DealsOnOonzoo extends StatefulWidget {
  const DealsOnOonzoo({super.key});

  @override
  State<DealsOnOonzoo> createState() => _DealsOnOonzooState();
}

class _DealsOnOonzooState extends State<DealsOnOonzoo> {
  List<String> product = [];

  @override
  void initState() {
    product = getData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(color: Colors.limeAccent),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Deals only on oonzoo",
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
                return Container(
                  height: 180,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      product[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
