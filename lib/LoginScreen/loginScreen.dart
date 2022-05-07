import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'body.dart';
import 'header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: SingleChildScrollView(  
        child: Column(
          children: [
            Header(),
            BODY(),




          ],
        ),
      ),
    );
  }
}


