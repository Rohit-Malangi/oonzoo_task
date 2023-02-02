import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../screens/varify_screen.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool _isLogin = true, _isLoading = false;
  String _userEmail = '';
  String _passWord = '';

  void _toggle() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _submmitLoginData() async {
    final isvalid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isvalid) return;
    _formKey.currentState!.save();
    try {
      setState(() {
        _isLoading = true;
      });
      await _auth.signInWithEmailAndPassword(
          email: _userEmail, password: _passWord);
    } on PlatformException catch (error) {
      var message = 'An Error ocurred, please cheak your credentials';
      if (error.message != null) {
        message = error.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      var message = error.toString();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _submmitSignupData() async {
    final isvalid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isvalid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: _userEmail,
              password: _passWord,
            )
            .then(
              (value) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Verify(),
                ),
              ),
            );
      } on PlatformException catch (error) {
        var message = 'An Error ocurred, please cheak your credentials.';
        if (error.message != null) {
          message = error.message!;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
        setState(() {
          _isLoading = true;
        });
      } catch (error) {
        var message = 'Email is already exixts .';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
        setState(() {
          _isLoading = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey('email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter a Email';
                  } else if (!value.endsWith('@gmail.com')) {
                    return 'Invalid Email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email Address'),
                onSaved: (value) {
                  _userEmail = value!.toString().trim();
                },
              ),
              TextFormField(
                  key: const ValueKey('password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Password';
                    }
                    if (value.length < 6) {
                      return 'Please Enter at least 6 digit password';
                    }
                    _passWord = value.toString().trim();
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (value) {
                    _passWord = value!.toString().trim();
                  }),
              if (!_isLogin)
                TextFormField(
                  key: const ValueKey('confirm_password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Confirm Password';
                    }
                    if (value.trim() != _passWord) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    if (_isLogin) {
                      _isLoading
                          ? const CircularProgressIndicator()
                          : _submmitLoginData();
                    } else {
                      _isLoading
                          ? const CircularProgressIndicator()
                          : _submmitSignupData();
                    }
                  },
                  child: Text(_isLogin ? 'Login' : 'Signup')),
              TextButton(
                  onPressed: _isLoading ? null : _toggle,
                  child: Text(_isLogin
                      ? 'Don\'t have an account?'
                      : 'Already have an account?')),
            ],
          )),
    );
  }
}
