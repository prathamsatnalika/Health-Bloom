import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_bloom/screens/resetpassword.dart';
import 'package:health_bloom/screens/signup.dart';
import 'package:health_bloom/userscreens/home.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'authentication_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                              child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
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
                                obscureText: true,
                                controller: passwordController,
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
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children : [
                            Container(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ResetScreen()));
                              },
                              child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),),
                            ),]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children : [
                            Container(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                              },
                              child: Text("Don't have a account, Create one", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),),
                            ),]
                      ),
                      Container(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 50,
                          child: RaisedButton(
                            color: Colors.deepPurpleAccent,
                            onPressed: () {
                                          context.read<AuthenticationService>().login(
                                            email: emailController.text.trim(),
                                            password: passwordController.text.trim(),
                                          ).then((value) => {
                                            if (value == "success") {
                                              Fluttertoast.showToast(
                                                  msg: "Logged In!",
                                                  toastLength: Toast.LENGTH_LONG,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.blue,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0
                                              ),
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Nav()))
                                            } else{
                                              Fluttertoast.showToast(
                                                msg: "Unknown Login Credentials Used",
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.BOTTOM,
                                                backgroundColor: Colors.blue,
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              )
                                            }
                                          });
                                        },
                            child: Center(
                              child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 5,
                      ),
                      // InkWell(
                      //  onTap: () => context.read<AuthenticationService>().
                      //     googleSignIn().then((User) => {
                      //       if (User != null) {
                      //         Navigator.of(context).push(MaterialPageRoute(builder: (_) => Nav()))
                      //       }
                      //  }),
                      //   child: Center(
                      //     child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_STNW9c.json',
                      //                           width: 50,height: 50),
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }}