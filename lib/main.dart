import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oonzoo_app/screens/home_screen.dart';
import 'package:oonzoo_app/screens/splash_screen.dart';

import './screens/authentication_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OONZOO_APP',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: StreamBuilder(
        key: Key("${Random().nextDouble()}"),
        stream: FirebaseAuth.instance.idTokenChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          if (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified) {
            return const HomeScreen();
          }
          return const AuthenticationScreen();
        },
      ),
    );
  }
}
