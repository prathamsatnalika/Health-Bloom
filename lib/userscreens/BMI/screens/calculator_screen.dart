import 'package:flutter/material.dart';
import 'package:health_bloom/userscreens/BMI/components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_bloom/userscreens/BMI/constants.dart';
import 'package:health_bloom/userscreens/BMI/utils/calculate_bmi.dart';
import 'package:lottie/lottie.dart';
import 'result_screen.dart';

enum Gender {
  male,
  female,
}

class CalculatorScreen extends StatefulWidget {
  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700
        )),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 25,
          ),
          Expanded(child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_ZyCSQa.json')),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
                border: Border.all(
                  color: Colors.deepPurpleAccent,
                  width: 5
                ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            width: MediaQuery. of(context). size. width/1.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      ' cm',
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold
                    )
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Colors.grey[300],
                    activeTrackColor: Colors.grey[300],
                    thumbColor: Colors.deepPurpleAccent,
                    overlayColor: Colors.grey[300],
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: MediaQuery. of(context). size. width/2.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(
                        color: Colors.deepPurpleAccent,
                        width: 5
                      ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                         style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold
                  ),
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                primary: Colors.grey
                            ),
                          ),

                          SizedBox(
                            width: 10.0,
                          ),

                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                primary: Colors.grey
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery. of(context). size. width/2.5,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurpleAccent,
                      width: 5
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                primary: Colors.grey
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                primary: Colors.grey
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
         Container(
           height: 30,
         ),
         // ignore: deprecated_member_use
         Container(
           width: MediaQuery. of(context). size. width/1.1,
           height: 65,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(20),
                 topRight: Radius.circular(20),
                 bottomLeft: Radius.circular(20),
                 bottomRight: Radius.circular(20)
             ),
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.5),
                 spreadRadius: 5,
                 blurRadius: 7,
                 offset: Offset(0, 3), // changes position of shadow
               ),
             ],
           ),
           child: RaisedButton(
             color: kActiveCardColour,
             child: Center(
               child: Text('Calculate',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                          )),
             ),
             onPressed: () {
               BmiLogic calc =
               BmiLogic(height: height, weight: weight);

               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => ResultsPage(
                     bmiResult: calc.calculateBMI(),
                     resultText: calc.getResult(),
                     interpretation: calc.getInterpretation(),
                   ),
                 ),
               );
             },
           ),
         ),
          Container(
            height: 30,
          ),
        ],
      ),
    );
  }
}
