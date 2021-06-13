import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';

class BpmHeart extends StatefulWidget {

  @override
  _BpmHeartState createState() => _BpmHeartState();
}

class _BpmHeartState extends State<BpmHeart> {

  Map<String, double> dataMap = {
    "Minimum BPM": 54,
    "Maximum BPM": 144
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30)
            ),
            child: Container(
              color: Colors.orange,
              child: Column(
                children: [
                  Container(height:20),
                  Row(
                    children: [
                      Container(width: 15),
                      IconButton(icon: Icon(Icons.close_outlined,size: 30),
                          onPressed: () {

                          })
                    ],
                  ),
                  Container(
                    height: 30,
                  ),
                  Text('Your Heart Rate',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        )),
                  Container(height: 5),
                  Text('57 BMP',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.white
                      )),
                  Container(
                    height: 30,
                  ),
                  Lottie.network('https://assets2.lottiefiles.com/packages/lf20_zkM5wn.json',width: 500,height: 100),
                  Container(height: 30),
                ],
              ),
            ),
          ),
            Column(
              children: [
                Container(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('Minimum',style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        )),
                        Container(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('54',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                )),

                            Text(' BPM',style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18
                            )),
                            Text(' 😴',style: TextStyle(
                                fontFamily: 'EmojiOne',
                                fontSize: 18
                            ))
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Text('Maximum',style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        )),
                        Container(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('114',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                )),

                            Text(' BPM',style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18
                            )),
                            Text(' 🔥',style: TextStyle(
                                fontFamily: 'EmojiOne',
                                fontSize: 18
                            ))
                          ],
                        )
                      ],
                    )

                  ],
                ),
                Container(
                  height: 40,
                ),
                PieChart(
                  dataMap: dataMap,
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
                    showChartValueBackground: true,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: false,
                    decimalPlaces: 1,
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
