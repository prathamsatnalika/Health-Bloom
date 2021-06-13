import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 243, 250, 1.0),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 80,
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
              Lottie.network('https://assets7.lottiefiles.com/packages/lf20_ZyCSQa.json',width: 310,height: 310),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  height: 220,
                  width: 380,
                  child: Column(
                    children: <Widget> [
                      Container(
                        height: 20,
                      ),
                     Container(
                       width: 340,
                       child: TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'height in cm',
                          icon: Icon(Icons.trending_up),
                        ),
                      ),
                     ),
                      SizedBox(height: 20),
                      Container(
                        width: 340,
                        child: TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'weight in kg',
                          icon: Icon(Icons.line_weight),
                        ),
                      ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),

              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 220,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.purple,Colors.purpleAccent],
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                    ),
                  ),
                  child: FlatButton(
                    child: Text(
                      'Calculate BMI',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: calculateBMI

                  ),
                ),
              ),

              SizedBox(height: 15),
              Text(
                _result == null ? "" : "Your Bmi is ${_result.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    _result = result;

    setState(() {});
    print(_result);
  }
}