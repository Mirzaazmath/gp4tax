
import 'package:flutter/material.dart';


import 'Register_body.dart';
import 'header.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
      SingleChildScrollView(
      child: Column(
        children: [
          header(),
          regbody(),
          SizedBox(height: 20,)


        ],
      ),
    ),
    );
  }
}
