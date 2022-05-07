import 'package:flutter/material.dart';
class header extends StatefulWidget {
  const header({Key? key}) : super(key: key);

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {
  @override
  Widget build(BuildContext context) {
    return  Container(



      height: MediaQuery.of(context).size.height*0.3,
      child: Center(
        child: Image.asset("assets/logo22.png"),
      ),
    );
  }
}