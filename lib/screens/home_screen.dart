import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oonzoo_app/screens/authentication_screen.dart';
import 'package:oonzoo_app/widgets/body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Row(children: [
                const Expanded(
                  child: TextField(
                    controller: null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'What are you looking for?',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.search),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.lightBlue,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            const Divider(),
            ListTile(
              onTap: () {},
              title: const Text(
                "Welcome to oonzoo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "${FirebaseAuth.instance.currentUser!.email}",
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: const Text(
                "Help",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: const Text(
                "Contect us",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AuthenticationScreen(),
                  ),
                );
              },
              title: const Text(
                "Sign out",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
      backgroundColor: Colors.cyanAccent,
      body: const BodyWidget(),
    );
  }
}
