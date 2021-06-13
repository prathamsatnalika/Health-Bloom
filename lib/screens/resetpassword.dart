import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';


class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
          children: [
            Container(
              height: 60,
            ),
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

            Lottie.network('https://assets9.lottiefiles.com/packages/lf20_ALIsoI.json',width: 350,
                            height: 350
                            ),

            Container(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email'
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
            ),

            Container(
              height: 30,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Container(
                width: 220,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.lightBlue,Colors.blueAccent,Colors.blue],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                  ),
                ),
                child: FlatButton(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(color: Colors.white),
                    ),
                  onPressed: () {
                    auth.sendPasswordResetEmail(email: _email);
                    Navigator.of(context).pop();
                  },

                ),
              ),
            ),

          ],),
    ]
      ),
    );
  }
}