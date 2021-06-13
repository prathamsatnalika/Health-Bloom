import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_bloom/screens/login.dart';
import 'package:health_bloom/userscreens/home.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  createData() {
    var _emailId = FirebaseAuth.instance.currentUser.email;

    DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance.collection('users').doc('$_emailId');
    var myJSONObj = {
      "First_Name": firstNameController.text,
      "Last_Name": "",
      "Phone_no" : phoneController.text,
      "Gender" : "",
      "Email" : _emailId.toString(),
      "step_walked_1": 0,
      "step_walked_2": 0,
      "step_walked_3": 0,
      "step_walked_4": 0,
      "step_walked_5": 0,
      "step_walked_6": 0,
      "step_walked_7": 0,
      "step_walked_target" : 2500,
      "Profile_pic" : "https://www.seekpng.com/png/full/41-410093_circled-user-icon-user-profile-icon-png.png",
      "Water_Drinked_1" : 0,
      "Water_Drinked_2" : 0,
      "Water_Drinked_3" : 0,
      "Water_Drinked_4" : 0,
      "Water_Drinked_5" : 0,
      "Water_Drinked_6" : 0,
      "Water_Drinked_7" : 0,
      "Water_Drinked_1_Target" : 2500,
      "Water_Drinked_2_Target" : 2500,
      "Water_Drinked_3_Target" : 2500,
      "Water_Drinked_4_Target" : 2500,
      "Water_Drinked_5_Target" : 2500,
      "Water_Drinked_6_Target" : 2500,
      "Water_Drinked_7_Target" : 2500,
    };
    users
        .set(myJSONObj)
        .then((value) => print("User with CustomID added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/light-1.png')
                                )
                            ),
                          )),
                      Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child:  Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/light-2.png')
                                )
                            ),
                          )),
                      Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/clock.png')
                                )
                            ),
                          )),
                      Positioned(
                          child:  Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                            ),
                          )),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child: TextField(
                                controller: firstNameController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Name",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child: TextField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 50,
                          child: RaisedButton(
                            color: Colors.deepPurpleAccent,
                            onPressed: () {
                              context.read<AuthenticationService>().register(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ).then((value) => {
                                if (value == "success") {
                                  Fluttertoast.showToast(
                                      msg: "Your account has been created!",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.blue,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  ),
                                  createData(),
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Nav())),
                                } else{
                                  Fluttertoast.showToast(
                                    msg: "Failed to create the Account",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                  print('Not Success!'),
                                }
                              });
                            },
                            child: Center(
                              child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 30,),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          child: Text("Already a User??", style: TextStyle(color: Color.fromRGBO(
                              143, 148, 251, 1.0)),)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}