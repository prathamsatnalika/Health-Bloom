import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WaterTrackerHistory extends StatefulWidget {
  const WaterTrackerHistory({Key key}) : super(key: key);

  @override
  _WaterTrackerHistoryState createState() => _WaterTrackerHistoryState();
}

class _WaterTrackerHistoryState extends State<WaterTrackerHistory> {

  var _emailId = FirebaseAuth.instance.currentUser.email;

  var _week = DateTime.now().weekday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
            ),
                 ClipRRect(
                   borderRadius: BorderRadius.circular(20),
                   child: Container(
                     decoration: new BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black12,
                           blurRadius: 50.0,
                           spreadRadius: 7.0,
                           offset: Offset(
                               0, 3
                           ),
                         )
                       ],
                     ),
                     width: 375,
                     child: Column(
                       children: [
                         Container(
                           alignment: Alignment.center,
                           width: 375,
                             decoration: new BoxDecoration(
                               boxShadow: [
                                 BoxShadow(
                                   color: Colors.blue,
                                   blurRadius: 10.0,
                                   spreadRadius: 7.0,
                                   offset: Offset(
                                       0, 3
                                   ),
                                 )
                               ],
                             ),
                           child: Column(
                             children: [
                               Container(
                                 height: 25,
                               ),
                               Text('Monday',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 27,
                                      color: Colors.white
                                    )),
                               Container(
                                 height: 15,
                               )
                             ],
                           )
                         ),
                        Container(
                          height: 20,
                        ),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Text('');
                              return
                                Container(
                                  alignment: Alignment.center,
                                  child: Text('Water Drinked:  ' + snapshot.data['Water_Drinked_1'].toString().trim() + ' mL',
                                    style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: Colors.white
                                    )),
                                );
                        },
                        ),
                         Container(
                           height: 10,
                         ),
                         StreamBuilder(
                           stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                           builder: (context, snapshot) {
                             if (!snapshot.hasData) return Text('');
                             return
                               Container(
                                 alignment: Alignment.center,
                                 child: Text('Water Drinking Target:  ' + snapshot.data['Water_Drinked_1_Target'].toString().trim() + ' mL',
                                     style: TextStyle(
                                         fontWeight: FontWeight.w700,
                                         fontSize: 20,
                                         color: Colors.white
                                     )),
                               );
                           },
                         ),
                         Container(
                           height: 20,
                         )
                   ]
                     ),
                   ),
                 ),

            Container(
              height: 20,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 50.0,
                      spreadRadius: 7.0,
                      offset: Offset(
                          0, 3
                      ),
                    )
                  ],
                ),
                width: 375,
                child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 375,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue,
                                blurRadius: 10.0,
                                spreadRadius: 7.0,
                                offset: Offset(
                                    0, 3
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 25,
                              ),
                              Text('Tuesday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 27,
                                      color: Colors.white
                                  )),
                              Container(
                                height: 15,
                              )
                            ],
                          )
                      ),
                      Container(
                        height: 20,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinked:  ' + snapshot.data['Water_Drinked_2'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 10,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinking Target:  ' + snapshot.data['Water_Drinked_2_Target'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 20,
                      )
                    ]
                ),
              ),
            ),

            Container(
              height: 20,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 50.0,
                      spreadRadius: 7.0,
                      offset: Offset(
                          0, 3
                      ),
                    )
                  ],
                ),
                width: 375,
                child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 375,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue,
                                blurRadius: 10.0,
                                spreadRadius: 7.0,
                                offset: Offset(
                                    0, 3
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 25,
                              ),
                              Text('Wednesday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 27,
                                      color: Colors.white
                                  )),
                              Container(
                                height: 15,
                              )
                            ],
                          )
                      ),
                      Container(
                        height: 20,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinked:  ' + snapshot.data['Water_Drinked_3'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 10,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinking Target:  ' + snapshot.data['Water_Drinked_3_Target'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 20,
                      )
                    ]
                ),
              ),
            ),

            Container(
              height: 20,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 50.0,
                      spreadRadius: 7.0,
                      offset: Offset(
                          0, 3
                      ),
                    )
                  ],
                ),
                width: 375,
                child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 375,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue,
                                blurRadius: 10.0,
                                spreadRadius: 7.0,
                                offset: Offset(
                                    0, 3
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 25,
                              ),
                              Text('Thursday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 27,
                                      color: Colors.white
                                  )),
                              Container(
                                height: 15,
                              )
                            ],
                          )
                      ),
                      Container(
                        height: 20,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinked:  ' + snapshot.data['Water_Drinked_4'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 10,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinking Target:  ' + snapshot.data['Water_Drinked_4_Target'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 20,
                      )
                    ]
                ),
              ),
            ),

            Container(
              height: 20,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 50.0,
                      spreadRadius: 7.0,
                      offset: Offset(
                          0, 3
                      ),
                    )
                  ],
                ),
                width: 375,
                child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 375,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue,
                                blurRadius: 10.0,
                                spreadRadius: 7.0,
                                offset: Offset(
                                    0, 3
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 25,
                              ),
                              Text('Friday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 27,
                                      color: Colors.white
                                  )),
                              Container(
                                height: 15,
                              )
                            ],
                          )
                      ),
                      Container(
                        height: 20,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinked:  ' + snapshot.data['Water_Drinked_5'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 10,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinking Target:  ' + snapshot.data['Water_Drinked_5_Target'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 20,
                      )
                    ]
                ),
              ),
            ),

            Container(
              height: 20,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 50.0,
                      spreadRadius: 7.0,
                      offset: Offset(
                          0, 3
                      ),
                    )
                  ],
                ),
                width: 375,
                child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 375,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue,
                                blurRadius: 10.0,
                                spreadRadius: 7.0,
                                offset: Offset(
                                    0, 3
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 25,
                              ),
                              Text('Saturday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 27,
                                      color: Colors.white
                                  )),
                              Container(
                                height: 15,
                              )
                            ],
                          )
                      ),
                      Container(
                        height: 20,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinked:  ' + snapshot.data['Water_Drinked_6'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 10,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinking Target:  ' + snapshot.data['Water_Drinked_6_Target'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 20,
                      )
                    ]
                ),
              ),
            ),

            Container(
              height: 20,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 50.0,
                      spreadRadius: 7.0,
                      offset: Offset(
                          0, 3
                      ),
                    )
                  ],
                ),
                width: 375,
                child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 375,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue,
                                blurRadius: 10.0,
                                spreadRadius: 7.0,
                                offset: Offset(
                                    0, 3
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 25,
                              ),
                              Text('Sunday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 27,
                                      color: Colors.white
                                  )),
                              Container(
                                height: 15,
                              )
                            ],
                          )
                      ),
                      Container(
                        height: 20,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinked:  ' + snapshot.data['Water_Drinked_7'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 10,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');
                          return
                            Container(
                              alignment: Alignment.center,
                              child: Text('Water Drinking Target:  ' + snapshot.data['Water_Drinked_7_Target'].toString().trim() + ' mL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white
                                  )),
                            );
                        },
                      ),
                      Container(
                        height: 20,
                      )
                    ]
                ),
              ),
            ),

            Container(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
