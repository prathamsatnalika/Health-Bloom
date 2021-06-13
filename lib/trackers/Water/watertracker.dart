import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({Key key}) : super(key: key);

  @override
  _WaterTrackerState createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {

  var _emailId = FirebaseAuth.instance.currentUser.email;
  var _week = DateTime.now().weekday;

  final TextEditingController _dataController = TextEditingController();

  printer(){
     print('Water_Drinked_'+_week.toString());
   }

  Future<void> updateData() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        .doc('$_emailId')
        .update({'Water_Drinked_'+_week.toString()+'_Target' : _dataController.text})
        .then((value) =>
          Fluttertoast.showToast(
            msg: "Updated Changes SuccessFully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 15.0
        ),
    )
        // ignore: return_of_invalid_type_from_catch_error
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> ResetData() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        .doc('$_emailId')
        .update({'Water_Drinked_'+_week.toString() : 0})
        .then((value) =>
        Fluttertoast.showToast(
            msg: "Reset Done SuccessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 15.0
        ),
    )
        // ignore: return_of_invalid_type_from_catch_error
        .catchError((error) => print("Failed to reset data: $error"));
  }


  Future<void> addMLData() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        .doc('$_emailId')
        .update({'Water_Drinked_'+_week.toString() : FieldValue.increment(100)})
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 243, 250,1),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Container(width: 30),
                  InkWell(
                    onTap: () {Navigator.pop(context);},
                    child: Icon(Icons.close_sharp,size: 30,),
                  )
                ],
              ),
              Container(
                height: 50,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      child: Lottie.network('https://assets6.lottiefiles.com/packages/lf20_SedlEa.json'),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.blue,
                          ),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => new AlertDialog(
                                    shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(
                                            Radius.circular(10.0))),
                                              content: Builder(
                                                builder: (context) {
                                                  var height = MediaQuery.of(context).size.height;
                                                  var width = MediaQuery.of(context).size.width;

                                                  return Container(
                                                     height: height - 520,
                                                      width: width - 150,
                                                      child: Column(
                                                        children: <Widget> [
                                                          Container(
                                                            height: 30,
                                                          ),
                                                          Container(
                                                            width: 300,
                                                            child: TextFormField(
                                                              controller: _dataController,
                                                              decoration: InputDecoration(
                                                                labelText: 'Water Target (In ML)'
                                                              ),
                                                            ),
                                                          ),
                                                          Container(height: 60),
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.circular(7),
                                                            child: Container(
                                                              width: 300,
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                gradient: LinearGradient(
                                                                  colors: [Colors.lightBlueAccent, Colors.lightBlue,Colors.blueAccent,Colors.blue],
                                                                  begin: FractionalOffset.centerLeft,
                                                                  end: FractionalOffset.centerRight,
                                                                ),
                                                              ),
                                                              child: FlatButton(
                                                                  child: Text(
                                                                    'Save Data',
                                                                    style: TextStyle(color: Colors.white),
                                                                  ),
                                                                  onPressed: updateData
                                                              ),
                                                            ),
                                                          ),
                                                          Container(height: 10),
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.circular(7),
                                                            child: Container(
                                                              width: 300,
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                gradient: LinearGradient(
                                                                  colors: [Colors.lightBlueAccent, Colors.lightBlue,Colors.blueAccent,Colors.blue],
                                                                  begin: FractionalOffset.centerLeft,
                                                                  end: FractionalOffset.centerRight,
                                                                ),
                                                              ),
                                                              child: FlatButton(
                                                                  child: Text(
                                                                    'Cancel',
                                                                    style: TextStyle(color: Colors.white),
                                                                  ),
                                                                  onPressed: () => Navigator.pop(context, true)
                                                              ),
                                                            ),
                                                          ),
                                              ],
                                            )
                                        );
                                      },
                                    ),
                                  )

                              );
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Text('');
                    return
                      Text('Water Drinked ' +snapshot.data['Water_Drinked_'+_week.toString()].toString().trim() + ' ML',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600
                          ));
                  },
                ),
              ),

              Container(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('users').doc('$_emailId').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Text('');
                    return
                      Text('out of '+ snapshot.data['Water_Drinked_'+_week.toString()+'_Target'].toString().trim() + ' ML',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w600
                          ));
                  },
                ),
              ),
              Container(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.lightBlueAccent, Colors.lightBlue,Colors.blueAccent,Colors.blue],
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                    ),
                  ),
                  child: FlatButton(
                      child: Text(
                        '+ 1 Glass (100 Ml)',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: addMLData
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.lightBlueAccent, Colors.lightBlue,Colors.blueAccent,Colors.blue],
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                    ),
                  ),
                  child: FlatButton(
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        ResetData();
                      }
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
