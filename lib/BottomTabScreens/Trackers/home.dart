import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom/BottomTabScreens/Home/components/doctor_card.dart';
import 'package:health_bloom/BottomTabScreens/Home/constant.dart';
import 'package:health_bloom/trackers/Step/step_tracker.dart';
import 'package:health_bloom/trackers/Water/navigator.dart';
import 'package:lottie/lottie.dart';

import 'Widgets/listBuilder.dart';

class TrackerScreenHome extends StatefulWidget {
  @override
  _TrackerScreenHomeState createState() => _TrackerScreenHomeState();
}

class _TrackerScreenHomeState extends State<TrackerScreenHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 60,
                      ),
                      Text(
                        "Here's some, \nFor You",
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
                child: Lottie.network('https://assets3.lottiefiles.com/private_files/lf30_rBgRS1.json',
                  width: 200,height: 200,
                )),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              ),
             child: Container(
               color: Colors.white,
               height: MediaQuery. of(context). size.height/1.8,
               child: Column(
                 children: [
                   Container(
                     height: 30,
                   ),
                   Padding(
                     padding: EdgeInsets.symmetric(
                       horizontal: 30,
                     ),
                     child: Column(
                       children: <Widget>[
                         SizedBox(
                           height: 20,
                         ),
                         InkWell(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => StepTracker()));
                           },
                           child: listBuilder(
                             'Step Tracker',
                             '',
                             'https://assets8.lottiefiles.com/packages/lf20_h4mjsyjz.json',
                             kYellowColor,
                           ),
                         ),
                         SizedBox(
                           height: 20,
                         ),
                         InkWell(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => WaterNav()));
                           },
                           child: listBuilder(
                             'Water Tracker',
                             '',
                             'https://assets1.lottiefiles.com/datafiles/u76E7YSpm1y66MU/data.json',
                             kOrangeColor,
                           ),
                         ),
                         SizedBox(
                           height: 20,
                         ),
                       ],
                     ),
                   ),
                   Container(
                     height: 20,
                   )
                 ],
               ),
             ),
            )
          ],
        ),
      )
    );
  }
}
