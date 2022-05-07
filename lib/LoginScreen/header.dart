import 'package:flutter/material.dart';
class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
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
