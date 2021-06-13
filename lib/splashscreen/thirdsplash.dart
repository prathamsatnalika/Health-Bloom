import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom/screens/login.dart';
import 'package:health_bloom/screens/login.dart';
import 'package:lottie/lottie.dart';

import 'package:health_bloom/screens/signup.dart';
import 'package:health_bloom/userscreens/home.dart';

import 'package:health_bloom/screens/login.dart';

class Splash3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(126, 130, 237,1),
            body: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: ClipRRect(
                          child: Container(
                            width: 450,
                            height: 520,
                            color: Color.fromRGBO(126, 130, 237,1),
                            child: Column(
                              children: <Widget> [
                                Container(
                                  height: 50,
                                ),
                                Lottie.network('https://assets3.lottiefiles.com/packages/lf20_jcsfwbvi.json',
                                    width: 450,height: 450),
                              ],
                            ),
                          )),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      child: Container(
                        color: Color.fromRGBO(234, 243, 250,1),
                        child: Column(
                          children: <Widget> [
                            Container(
                              height: 20,
                            ),
                            Text('Save Your Prescriptions!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                )),
                            Container(
                              height: 10,
                            ),
                            Container(
                                alignment: Alignment.center,
                                height: 90,
                                width: 230,
                                child: Text('By selecting one picture in the app you can save your prescription for ever',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black45,
                                  ),)),
                            Container(
                              height: 20,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget> [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey),
                                  ),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey),
                                  ),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(86, 105, 255,1)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                            ),
                            Container(
                                width: 300,
                                height: 50,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                  },
                                  color: Color.fromRGBO(86, 105, 255,1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("Get Started",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                  ),),
                                )),

                            Container(height: 30)
                          ],
                        ),
                      ),
                    )
                  ]),
            )));}}



