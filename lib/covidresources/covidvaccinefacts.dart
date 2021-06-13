import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CovidVaccineFacts extends StatelessWidget {
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
                                  child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_q9ouvrvk.json',
                                      width: 120,height: 120),
                                ),
                                Container(
                                  width: 200,
                                  child: Text("Vaccines are tested thoroughly for safety before they're made available to the public",
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
                                  child: Lottie.network('https://assets1.lottiefiles.com/packages/lf20_culjluaz.json',
                                      width: 120,height: 120),
                                ),
                                Container(
                                  width: 200,
                                  child: Text('Vaccine trials involve a diverse range of volunteers',
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
                                  child: Lottie.network('https://assets1.lottiefiles.com/private_files/lf30_p5tali1o.json',
                                      width: 120,height: 120),
                                ),
                                Container(
                                  width: 200,
                                  child: Text("You won't be able to make a COVID-19 vaccine at home",
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
                                  child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_zv39zodk.json',
                                      width: 120,height: 120),
                                ),
                                Container(
                                  width: 200,
                                  child: Text("COVID-19 vaccines were developed quickly while maintaining the highest safety standard possible.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                )
            )
        )
    );
  }
}