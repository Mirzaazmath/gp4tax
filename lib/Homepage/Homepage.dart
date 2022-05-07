import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

import '../LoginScreen/loginScreen.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? logindata;
   String? username;
   String? password;
  var url="https://jsonplaceholder.typicode.com/posts";
  var postjson=[];
  void postData()async{
    try {
      final respone = await post(Uri.parse(url),
          body: {

            "id": "2"
          }
      );
      print(respone.body);
    }catch(erre){}
  }
  void fetchPosts()async{
    try{
      final respone1 =await get(Uri.parse(url));
          final jsonData= jsonDecode(respone1.body) as List;
          setState(() {
            postjson=jsonData;
          });

      }catch(err){}

  }
  @override
   initState()  {
    // TODO: implement initState
    super.initState();
    initial();
    /*fetchPosts();*/
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata?.getString('username')!;
      password = logindata?.getString('password')!;
      /*if(username==null||password==null){
        Usernull_check();
      }*/
    });
  }
  /*void Usernull_check() async {
    logindata = await SharedPreferences.getInstance() as SharedPreferences?;
   await logindata?.clear();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => LoginScreen(),
      ),
    );

  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: postData,
              child: Text("Post"),


            ),
        Text(
          'Welcome To GPT.com  $username',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
            Text(
              'your password is  $password',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ElevatedButton(
            onPressed: () async {
              logindata = await SharedPreferences.getInstance();
              await logindata?.clear();
            },
            child: Text("clear"),


          ),

           /* ListView.builder(
              shrinkWrap: true,
                itemCount: postjson.length,
                itemBuilder:(context ,i) {
                  final post =postjson[i];
                  return Text("Title:${post["title"]}  id:${post["id"]}");

                }
            ),*/
          ],
        ),
      )
    );
  }
}
