import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pie_chart/pie_chart.dart';


class StepTracker extends StatefulWidget {
  const StepTracker({Key key}) : super(key: key);

  @override
  _StepTrackerState createState() => _StepTrackerState();
}

class _StepTrackerState extends State<StepTracker> {

   var _week = DateTime.now().weekday;
   var _emailId = FirebaseAuth.instance.currentUser.email;

   var _stepsWalked = 0;
   var _stepTarget = 0;
   var _stepLeft = 0;

   final TextEditingController _addedSteps = TextEditingController();

   double _calories = 0;
   double _distance = 0;
   double _stepWalkedInt = 0;
   double _stepWalkedSec = 0;

   var _stepWalkedMin = 0;

   Future<void> addSteps() {
     CollectionReference users = FirebaseFirestore.instance.collection('users');
     return users
         .doc('$_emailId')
         .update({'step_walked_'+'$_week' : FieldValue.increment(100)})
         .then((value) =>
         Fluttertoast.showToast(
             msg: "Added SuccessFully!",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.BOTTOM,
             backgroundColor: Colors.blue,
             textColor: Colors.white,
             fontSize: 15.0
         ),
     )
         .catchError((error) => print("Failed to update users data: $error"));
   }

   void getDetails() {
     FirebaseFirestore.instance
         .collection("users")
         .where("Email", isEqualTo: _emailId)
         .get()
         .then((value) {
            value.docs.forEach((result) {
              setState(() {
                _stepsWalked = result.data()['step_walked_'+_week.toString()];
                _stepTarget = result.data()['step_walked_target'];
                _stepLeft = result.data()['step_walked_target'] - result.data()['step_walked_'+_week.toString()];
                _stepWalkedInt = _stepsWalked.toDouble();
            });
         //print(result.data()['step_walked_'+_week.toString()]);
       });
     });

     _stepWalkedSec = _stepWalkedInt * 0.5;
     _stepWalkedMin = Duration(seconds: _stepWalkedSec.toInt()).inMinutes;
     _calories = _stepWalkedInt * 0.03;
     _distance = _stepWalkedInt *0.8045;


   }

  @override
  Widget build(BuildContext context) {
    getDetails();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                title: Text('Add steps walked',
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
                        height: height - 650,
                        width: width - 300,
                        child: Column(
                          children: <Widget> [
                            Container(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {
                                addSteps();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 40,
                                  color: Colors.deepPurpleAccent,
                                  child: Center(
                                   child: Text(
                                     '+100 steps',
                                     style: TextStyle(
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 16
                                     ),
                                   ),
                                 ),
                                ),
                              ),
                            )
                          ],
                          
                        )
                    );
                  },
                ),
              )

          );
        },
      ),
      backgroundColor: Color.fromRGBO(234, 243, 250, 1.0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                                              bottomRight: Radius.circular(25)),
              child: Container(
                color: Color.fromRGBO(77, 88, 222,1),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Container(width: 15),
                        IconButton(icon: Icon(Icons.close_outlined,size: 30),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                    Image.network('https://cdn.iconscout.com/icon/free/png-256/shoes-3154759-2634237.png',
                                  width: 150,height: 150,),
                    Container(height: 10),
                    Text('$_stepsWalked Steps',style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700
                    )),
                    Container(
                      height: 25,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
            ),
            Text('You walked $_stepWalkedMin min Today!',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
              Container(
                height: 20,
              ),
              Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 130,
                            height: 75,
                            alignment: Alignment.center,
                            color: Colors.deepPurpleAccent,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 10,
                                ),
                                Text(
                                  'DISTANCE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: _distance.toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' m',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            alignment: Alignment.center,
                            width: 130,
                            height: 75,
                            color: Colors.deepPurpleAccent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 10,
                                ),
                                Text(
                                  'CALORIES',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: _calories.toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' cal',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            Container(
              height: 25,
            ),
            Text('Your Progress'),
            Container(
              height: 30,
            ),
            PieChart(
              dataMap:{
                "Steps Walked" : _stepsWalked.toDouble(),
                "Steps Not Walked" : _stepLeft.toDouble()
              },
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 32,
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
            ),
            Container(height: 70)
          ],
        ),
      ),
    );
  }
}
