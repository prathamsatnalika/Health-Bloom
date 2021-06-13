import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CovidFacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromRGBO(234, 243, 250,1),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget> [
                  Container(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget> [
                      Container(width: 30,),
                      InkWell(
                        onTap: () {Navigator.pop(context);},
                        child: Icon(Icons.arrow_back_ios_outlined),
                      )
                    ],
                  ),

                  Container(height: 30),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      width: 350,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          Container(width: 10),
                          Container(
                          child: Lottie.network('https://assets5.lottiefiles.com/private_files/lf30_4avuVV.json',
                                                  width: 120,height: 120),
                          ),
                          Container(
                            width: 200,
                            child: Text('Most people who get COVID-19 have mild or moderate symptoms and can recover with medical care',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17,
                                        )),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(height: 30),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      width: 350,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          Container(width: 10),
                          Container(
                            child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_tqdnlfde.json',
                                width: 120,height: 120),
                          ),
                          Container(
                            width: 200,
                            child: Text('People of all ages can be infected by the COVID-19 virus.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(height: 30),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      width: 350,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          Container(width: 10),
                          Container(
                            child: Image.network('https://static.thenounproject.com/png/41709-200.png',

                                width: 120,height: 120),
                          ),
                          Container(
                            width: 200,
                            child: Text("Eating garlic doesn't prevent or cure COVID-19",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(height: 30),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      width: 350,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          Container(width: 10),
                          Container(
                            child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_GuZe5t.json',

                                width: 120,height: 120),
                          ),
                          Container(
                            width: 200,
                            child: Text("Heat and humidity don't stop the spread of COVID-19",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(height: 30),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      width: 350,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          Container(width: 10),
                          Container(
                            child: Lottie.network('https://assets4.lottiefiles.com/packages/lf20_medwe7cs.json',
                                width: 120,height: 120),
                          ),
                          Container(
                            width: 200,
                            child: Text('Thermal scanners detect fever, not COVID-19',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(height: 30),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      width: 350,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          Container(width: 10),
                          Container(
                            child: Image.network('https://i.ibb.co/nsDNj0Y/kkqr086c.png',
                                width: 120,height: 120),
                          ),
                          Container(
                            width: 200,
                            child: Text("Hand dryers don't prevent COVID-19",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(height: 30),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      width: 350,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          Container(width: 10),
                          Container(
                            child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_vlZ09F.json',
                                width: 120,height: 120),
                          ),
                          Container(
                            width: 200,
                            child: Text("It's very unlikely that shoes spread COVID-19",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(height: 30),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      width: 350,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          Container(width: 10),
                          Container(
                            child: Lottie.network('https://assets1.lottiefiles.com/packages/lf20_9pMJqS.json',
                                width: 120,height: 120),
                          ),
                          Container(
                            width: 200,
                            child: Text("5G mobile networks don't spread COVID-19",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                )),
                          )
                        ],
                      ),
                    ),
                  )

                ],
               )
             )
           )
          )
        );
      }
}