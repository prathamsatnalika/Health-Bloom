import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom/screens/login.dart';
import 'package:lottie/lottie.dart';

class SignOutScreen extends StatefulWidget {
  @override
  _SignOutScreenState createState() => _SignOutScreenState();
}

class _SignOutScreenState extends State<SignOutScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Logout',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(234, 243, 250,1),
        body: Column(
          children: <Widget> [
            Container(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Container(width: 30),
                InkWell(
                  onTap: () {Navigator.pop(context);},
                  child: Icon(Icons.arrow_back_ios_outlined),
                )
              ],
            ),
            Container(height: 30),
            Lottie.network('https://assets8.lottiefiles.com/packages/lf20_0fwl68.json',
                          width: 450,height: 450),
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Container(
                width: 220,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.purple,Colors.purpleAccent],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                  ),
                ),
                child: FlatButton(
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                    onPressed: () async{
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
