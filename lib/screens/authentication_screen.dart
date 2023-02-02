import 'package:flutter/material.dart';

import '../widgets/auth_widget.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              SizedBox(height: 20),
              Text(
                "WELCOME TO OONZOO",
                softWrap: true,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              AuthWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
