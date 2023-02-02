import 'package:flutter/material.dart';

import './circular_category.dart';
import './electronics.dart';
import './only_on_oonzoo.dart';
import './recommanded_widgets.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          CircularCategory(),
          RecommandWidget(),
          DealsOnOonzoo(),
          ElectronicsWidget(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
