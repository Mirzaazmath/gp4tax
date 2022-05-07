import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Homepage/Homepage.dart';
import '../Register/Register.dart';
class BODY extends StatefulWidget {
  const BODY({Key? key}) : super(key: key);

  @override
  State<BODY> createState() => _BODYState();
}

class _BODYState extends State<BODY> {
  TextEditingController Email1 = new TextEditingController();
  TextEditingController Pass1 = new TextEditingController();
   SharedPreferences? logindata;
   bool? newuser;


  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  void   check_if_already_login()async{
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata?.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(25),
            child:  Row(
              children: [
                Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold  ,fontSize: 40,),)
              ],
            ),

          ),

          Padding(padding: EdgeInsets.all( 20),
              child:TextFormField(
                controller: Email1,
                decoration: InputDecoration(
                  hintText: "EMAIL ID",
                  label: Text("EMAIL ID:"),
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                validator: (value) {
                  // Check if this field is empty
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }

                  // using regular expression
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please enter a valid email address";
                  }

                  // the email is valid
                  return null;
                },
              )),





          Padding(padding: EdgeInsets.all( 20),
              child:TextFormField(
                controller: Pass1,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  hintText: "PASSWORD",
                  label: Text("PASSWORD:"),
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: Icon( _isObscure ? Icons.visibility : Icons.visibility_off,),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),


                ),
                validator: (value) {
                  // Check if this field is empty
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }

                  // using regular expression
                  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
                    return "Please enter a valid password";
                  }

                  // the email is valid
                  return null;
                },
              )),
          Padding(padding: EdgeInsets.all(50),

              child: Container(
                height: 50,
                width: 550,

                child:  RaisedButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), ),

                  color: Colors.green,
                  onPressed:  (){
                    if (_formKey.currentState!.validate()) {
                      String username = Email1.text;
                      String password = Pass1.text;
                      if (username != '' && password != '') {
                        print('Successfull');
                        logindata?.setBool('login', false);
                        logindata?.setString('username', username);
                        logindata?.setString('password', password);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    }
                  }, child:  Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
              )



          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(
                          color: Colors.black, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: ' REGISTER NOW',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {

                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder:
                                        (context) =>
                                        Register()));

                                // navigate to desired screen
                              }
                        )
                      ]
                  ),
                ),
              )
          )


        ],
      ),
    );
  }
}
