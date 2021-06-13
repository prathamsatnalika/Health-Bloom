import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:health_bloom/screens/signup.dart';
import 'package:health_bloom/userscreens/home.dart';

class Exercises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Different Exercises'),
        centerTitle: true,
        backgroundColor: Colors.purple
      ),
          backgroundColor: Color.fromRGBO(234, 243, 250,1),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                      Container(
                        height: 50,
                      ),
                    ClipRRect (
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 380,
                        height: 150,
                        color: Colors.white,
                        child: Row(
                          children: <Widget> [
                            Lottie.network('https://assets6.lottiefiles.com/packages/lf20_sz79nzyi.json',
                                width: 150,height: 150),
                           Container(
                             alignment: Alignment.centerLeft,
                             child: Column(
                               children: <Widget> [
                                 Container(
                                   height: 20,
                                 ),
                                 Text(
                                   'Elbow to knee crunch helps in ',
                                   style: TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.w700
                                   ),
                                 ),
                                 Text(
                                   'Building Muscules. This intense ',
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w700
                                   ),
                                 ),
                                 Text(
                                   'muscle isolation them popular.',
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w700
                                   ),
                                 )
                               ],
                             ),
                           )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    ClipRRect (
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 380,
                        height: 150,
                        color: Colors.white,
                        child: Row(
                          children: <Widget> [
                            Lottie.network('https://assets6.lottiefiles.com/packages/lf20_jpaxqp3a.json',
                                width: 150,height: 150),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget> [
                                  Container(
                                    height: 20,
                                  ),
                                  Text(
                                    'The Russian twist is a simple ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                    'abdominal exercise for working ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                    'the core, shoulders, and hips',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    ClipRRect (
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 380,
                        height: 150,
                        color: Colors.white,
                        child: Row(
                          children: <Widget> [
                            Lottie.network('https://assets6.lottiefiles.com/packages/lf20_1zaxfd4f.json',
                                width: 150,height: 150),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget> [
                                  Container(
                                    height: 20,
                                  ),
                                  Text(
                                    'Planking only benefits your abs,',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                    'but can also help tone your',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                    'glutes and inner thighs.',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    ClipRRect (
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 380,
                        height: 150,
                        color: Colors.white,
                        child: Row(
                          children: <Widget> [
                            Lottie.network('https://assets6.lottiefiles.com/packages/lf20_xltkjuyg.json',
                                width: 150,height: 150),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget> [
                                  Container(
                                    height: 20,
                                  ),
                                  Text(
                                    'Crab toe touches is a home work ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                    'out exercise that targets hamstr',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                    '-ings,Lower back and Quadriceps.',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    ClipRRect (
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 380,
                        height: 150,
                        color: Colors.white,
                        child: Row(
                          children: <Widget> [
                            Lottie.network('https://assets9.lottiefiles.com/packages/lf20_35nvthub.json',
                                width: 150,height: 150),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget> [
                                  Container(
                                    height: 20,
                                  ),
                                  Text(
                                    'The triceps extension works the',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                    'back of the upper arm, including',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                    'the long, medial.',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ]
                ),
              ),
    );
  }
}
