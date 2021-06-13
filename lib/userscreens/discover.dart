import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom/screens/signup.dart';
import 'package:health_bloom/userscreens/home.dart';
import 'package:lottie/lottie.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromRGBO(234, 243, 250, 1),
            body: SingleChildScrollView(
                child: Container(
                    child: Column(
                        children: <Widget>[
                          Container(
                            height: 80,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget> [
                              Container(width: 25),
                              InkWell(
                                onTap: () {Navigator.pop(context);},
                                child: Icon(Icons.arrow_back_ios_outlined),
                              )
                            ],
                          ),
                          Container(
                            height: 30,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget> [
                                Container(width: 25),
                                   InkWell(
                                     onTap: () {
                                       showDialog(
                                           context: context,
                                           builder: (_) => new AlertDialog(
                                             title: Text('Nutrition 🍲 ',
                                                 textAlign: TextAlign.center,
                                                 style: TextStyle(
                                                     fontSize: 24.0,
                                                     fontWeight: FontWeight.w700
                                                 )),
                                             shape: RoundedRectangleBorder(
                                                 borderRadius:
                                                 BorderRadius.all(
                                                     Radius.circular(10.0))),
                                             content: Builder(
                                               builder: (context) {
                                                 var height = MediaQuery.of(context).size.height;
                                                 var width = MediaQuery.of(context).size.width;

                                                 return Container(
                                                     height: height - 550,
                                                     width: width - 300,
                                                     child: Column(
                                                       children: <Widget> [
                                                         Container(
                                                           width: 300,
                                                           height: 60,
                                                           alignment: Alignment.center,
                                                           child: Text(
                                                               'A substance that provides nourishment essential for the maintenance of life and for growth.'
                                                           ),
                                                         ),
                                                         Container(
                                                           height: 20,
                                                         ),
                                                         Container(
                                                             width: 200,
                                                             height: 55,
                                                             alignment: Alignment.center,
                                                             child: Text(
                                                                 'This helps us to fight against diseases'
                                                             )
                                                         ) ,
                                                         Container(
                                                           height: 20,
                                                         ),
                                                         Container(
                                                           child: Lottie.network('https://assets8.lottiefiles.com/packages/lf20_E3zV8N.json',
                                                             width: 100,height: 100,),
                                                         )
                                                       ],
                                                     )
                                                 );
                                               },
                                             ),
                                           )

                                       );
                                     },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(23),
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 50.0,
                                              spreadRadius: 7.0,
                                              offset: Offset(
                                                 0, 3
                                              ),
                                            )
                                          ],
                                        ),

                                        width: 250,
                                        height: 150,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget> [
                                            Lottie.network('https://assets1.lottiefiles.com/packages/lf20_TmewUx.json',
                                                            height: 100,width: 100),
                                            Container(
                                              width: 120,
                                              height: 80,
                                              child: Text('Hmmm, Learn About Nutrient??',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                          ),),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                Container(
                                  width: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => new AlertDialog(
                                          title: Text('Increase Height',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w700
                                              )),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          content: Builder(
                                            builder: (context) {
                                              var height = MediaQuery.of(context).size.height;
                                              var width = MediaQuery.of(context).size.width;

                                              return Container(
                                                  height: height - 350,
                                                  width: width - 250,
                                                  child: Column(
                                                    children: <Widget> [
                                                      Container(
                                                        width: 300,
                                                        height: 60,
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                            'You should continue these as an adult to promote overall well-being and retain your height.'
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 15,
                                                      ),
                                                      Container(
                                                          width: 200,
                                                          height: 55,
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                              'Use supplements with caution.'
                                                          )
                                                      ) ,
                                                      Container(
                                                        height: 15,
                                                      ),
                                                      Container(
                                                          width: 200,
                                                          height: 55,
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                              'Get the right amount of sleep'
                                                          )
                                                      ) ,
                                                      Container(
                                                        height: 15,
                                                      ),
                                                      Container(
                                                          width: 200,
                                                          height: 55,
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                              'Use yoga to maximize your height.'
                                                          )
                                                      ) ,
                                                      Container(
                                                        height: 20,
                                                      ),
                                                      Container(
                                                        child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_vgpp86f2.json',
                                                          width: 150,height: 150,),
                                                      )
                                                    ],
                                                  )
                                              );
                                            },
                                          ),
                                        )

                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(23),
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 50.0,
                                            spreadRadius: 7.0,
                                            offset: Offset(
                                                0, 3
                                            ),
                                          )
                                        ],
                                      ),

                                      width: 250,
                                      height: 150,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget> [
                                          Lottie.network('https://assets9.lottiefiles.com/packages/lf20_0UtoBC.json',
                                              height: 100,width: 100),
                                          Container(
                                            width: 120,
                                            height: 100,
                                            child: Text('Want to learn how to increase Height?',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget> [
                              Container(width: 20,),
                              Text('Know more',style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700
                              ))
                            ],
                          ),
                          Container(
                            height: 25,
                          ),
                          
                          InkWell(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                height: 145,
                                width: 350,
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget> [
                                        Container(
                                          height: 20,
                                        ),
                                        Text(
                                          '    Your sleep in fit',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget> [
                                            Container(width: 20,),
                                            Container(
                                              width: 150,
                                              height: 80,
                                              child: Text(
                                              'Learn which factors affects sleep need, and how to find the right amount for you'
                                              ) ,
                                              )
                                          ],
                                        ),

                                      ],
                                    ),
                                    Lottie.network('https://assets5.lottiefiles.com/packages/lf20_E94I4T.json')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                  builder: (_) => new AlertDialog(
                                    title: Text('Keep your Hands Clean',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w700
                                                )),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(10.0))),
                                    content: Builder(
                                      builder: (context) {
                                        var height = MediaQuery.of(context).size.height;
                                        var width = MediaQuery.of(context).size.width;

                                        return Container(
                                          height: height - 550,
                                          width: width - 300,
                                          child: Column(
                                            children: <Widget> [
                                              Container(
                                                width: 300,
                                                height: 60,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Regularly wash your hands with soap and warm water for atleast 40 seconds'
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                              ),
                                              Container(
                                                width: 200,
                                                height: 55,
                                                alignment: Alignment.center,
                                                child: Text(
                                                      'This kill any germs that might be in your hand'
                                                )
                                              ) ,
                                              Container(
                                                height: 20,
                                              ),
                                              Container(
                                                child: Image.network('https://cdn.freebiesupply.com/logos/large/2x/who-logo-png-transparent.png',
                                                                      width: 100,height: 100,),
                                              )
                                            ],
                                          )
                                        );
                                      },
                                    ),
                                  )

                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                height: 145,
                                width: 350,
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget> [
                                        Container(
                                          height: 20,
                                        ),
                                        Text(
                                          '  Avoid Getting Sick',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget> [
                                            Container(
                                              width: 130,
                                              height: 80,
                                              child: Text(
                                                  'Follow these Simple Steps to reduce the risk of catching Covid-19'
                                              ) ,
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                    Lottie.network('https://assets8.lottiefiles.com/private_files/lf30_1lysabyy.json',
                                                  width:150,height: 150)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                    )
                )
            )
        )
    );
  }
}

