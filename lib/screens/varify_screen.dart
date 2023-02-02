import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final _auth = FirebaseAuth.instance;
  Timer? timer;

  @override
  void initState() {
    _auth.currentUser!.sendEmailVerification();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_auth.currentUser!.emailVerified) {
        timer.cancel();
        Navigator.of(context).pop();
      }
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'An verification email sent to ${_auth.currentUser!.email} please verify and do not press back bottom , It will automatically backed than login.',
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    await _auth.currentUser!.reload();
  }
}
