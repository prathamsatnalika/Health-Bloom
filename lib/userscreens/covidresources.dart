import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CovidResources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromRGBO(234, 243, 250,1),
          body: Column(
            children: <Widget>[
              Container(
                height: 70,
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
              InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    width: 350,
                    height: 120,
                    color: Color.fromRGBO(206, 247, 247, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(width: 20),
                        Container(
                          width: 150,
                          child: Text(
                            'Covid 19 Live India Cases',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Container(width: 50),
                        Lottie.network('https://assets7.lottiefiles.com/packages/lf20_ntnh0s55.json')
                      ],
                    ),
                  ),
                ),
              ),

              Container(height: 20),
              InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    width: 350,
                    height: 120,
                    color: Color.fromRGBO(206, 247, 247, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(width: 20),
                        Container(
                          width: 190,
                          child: Text(
                            'Covid 19 Live WorldWide Cases',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Container(width: 10),
                        Lottie.network('https://assets8.lottiefiles.com/packages/lf20_8axjdnts.json',
                                        height: 1200,width: 120)
                      ],
                    ),
                  ),
                ),
              ),

              Container(height: 20),

              InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    width: 350,
                    height: 120,
                    color: Color.fromRGBO(206, 247, 247, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(width: 20),
                        Container(
                          width: 190,
                          child: Text(
                            'Facts about Covid 19',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Container(width: 10),
                        Lottie.network('https://assets6.lottiefiles.com/private_files/lf30_ivjl6k5z.json',
                            height: 1200,width: 120)
                      ],
                    ),
                  ),
                ),
              ),

              Container(height: 20),

              InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    width: 350,
                    height: 120,
                    color: Color.fromRGBO(206, 247, 247, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(width: 20),
                        Container(
                          width: 190,
                          child: Text(
                            'Facts about Covid-19 Vaccine',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Container(width: 10),
                        Lottie.network('https://assets10.lottiefiles.com/packages/lf20_zv39zodk.json',
                            height: 1200,width: 120)
                      ],
                    ),
                  ),
                ),
              )

            ],
          )
        )
    );
  }
}