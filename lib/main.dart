import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Homepage/Homepage.dart';
import 'LoginScreen/loginScreen.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? logindata;
  bool? newuser;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      check_if_already_login();
    }
        // navigating to homepage
           /* ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    LoginScreen()
            )
        )*/
    );
  }
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata?.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    }else{
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => LoginScreen()));

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
      Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo22.png"),
            SizedBox(height: 5,),
            Text("Global Prime Taxation, LLC")
          ],
        )

      ),
    )
    );
  }
}


