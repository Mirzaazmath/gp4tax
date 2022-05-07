import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../Homepage/Homepage.dart';
import '../LoginScreen/loginScreen.dart';
class regbody extends StatefulWidget {
  const regbody({Key? key}) : super(key: key);

  @override
  State<regbody> createState() => _regbodyState();
}

class _regbodyState extends State<regbody> {
  bool _isObscure = true;
  bool _isObscure1 = true;
  TextEditingController Email=new TextEditingController();
  TextEditingController FName=new TextEditingController();
  TextEditingController MName=new TextEditingController();
  TextEditingController LName=new TextEditingController();
  TextEditingController Mobile=new TextEditingController();
  TextEditingController PASS=new TextEditingController();
  TextEditingController CONPASS=new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
      children: [
        Padding(padding: EdgeInsets.all(25),
          child:  Row(
            children: [
              Text("REGISTER",style: TextStyle(fontWeight: FontWeight.bold  ,fontSize: 40,),)
            ],
          ),

        ),

        Padding(padding: EdgeInsets.all( 10),
            child:TextFormField(
              controller: FName,
              decoration: InputDecoration(
                hintText: "FIRST NAME",
                label: Text("First Name:"),
                prefixIcon: Icon(Icons.supervised_user_circle_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              validator: (val) {
                if (val!.isEmpty) return 'Enter First name';
              },
            )),
        Padding(padding: EdgeInsets.all( 10),
            child:TextFormField(
              controller: MName,
              decoration: InputDecoration(
                hintText: "MIDDLE NAME",
                label: Text("Middle Name:"),
                prefixIcon: Icon(Icons.supervised_user_circle_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              validator: (val) {
                if (val!.isEmpty) return 'Enter middle name';
              },

            )),
        Padding(padding: EdgeInsets.all( 10),
            child:TextFormField(
              controller: LName,
              decoration: InputDecoration(
                hintText: "LAST NAME",
                label: Text("Last Name:"),
                prefixIcon: Icon(Icons.supervised_user_circle_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              validator: (val) {
                if (val!.isEmpty) return 'Enter last name';
              },

            )),
        Padding(padding: EdgeInsets.all(10),
            child:TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: Email,
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





        Padding(padding: EdgeInsets.all( 10),
            child:TextFormField(
              controller: PASS,
              keyboardType: TextInputType.visiblePassword,
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
        Padding(padding: EdgeInsets.all( 10),
            child:TextFormField(
              controller: CONPASS,
              obscureText: _isObscure1,
              decoration: InputDecoration(
                hintText: "CONFIRM PASSWORD",
                label: Text("Confirm Password:"),
                prefixIcon: Icon(Icons.key),
                suffixIcon: IconButton(
                  icon: Icon( _isObscure1 ? Icons.visibility : Icons.visibility_off,),
                  onPressed: () {
                    setState(() {
                      _isObscure1 = !_isObscure1;
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
                if (value!=PASS.text) {
                  return "Password is not match";
                }

                // the email is valid
                return null;
              },
            )),
        Padding(padding: EdgeInsets.all( 10),
            child:TextFormField(
              controller: Mobile,
            keyboardType: TextInputType.number,

              decoration: InputDecoration(
                hintText: "MOBILE NO",
                label: Text("Mobile No:"),
                prefixIcon: Icon(Icons.phone),
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
                if (value.length != 10){
                  return "Please enter valid number ";
                }

                // the email is valid
                return null;
              },
            )),

        Padding(padding: EdgeInsets.all(40),

            child: Container(
              height: 50,
              width: 550,

              child:  RaisedButton(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), ),

                color: Colors.green,
                onPressed:  (){ if (_formKey.currentState!.validate()) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  );
                }

                }, child:  Text("REGISTER",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
            )



        ),
        Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Already have an account?' ,
                    style: TextStyle(
                        color: Colors.black, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: 'LOGIN NOW',
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 18),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder:
                                      (context) =>
                                      LoginScreen()));




                              // navigate to desired screen
                            }
                      )
                    ]
                ),
              ),
            )
        )
      ],
    ),);
  }

}
