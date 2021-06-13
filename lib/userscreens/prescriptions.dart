import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom/userscreens/savepresciption.dart';
import 'package:health_bloom/userscreens/sucessfull.dart';
import 'package:lottie/lottie.dart';

class AllPrecriptions extends StatefulWidget {
  const AllPrecriptions({Key key}) : super(key: key);

  @override
  _AllPrecriptionsState createState() => _AllPrecriptionsState();
}

class _AllPrecriptionsState extends State<AllPrecriptions> {

  var _emailId = FirebaseAuth.instance.currentUser.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 243, 250,1),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SavePres()));
        },
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('$_emailId saves').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((document){
              return SingleChildScrollView(
                  child: Column(
                    children :[
                      Container(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.white,
                          width: 340,
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                              ),
                              InkWell(child: Image.network(document['Image_URL'],width: 240,height: 240),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        content: Image.network(document['Image_URL'])
                                      )
                                  );
                                },
                              ),
                              Container(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  Text(
                                      "Doctor's Name: " + document['Doctor_Name'],
                                    style: TextStyle(
                                      fontSize: 16
                                    ),
                                  ),
                                  Text(
                                      "Patient's Name: " + document['Patient_Name'],
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: InkWell(child: Icon(Icons.delete),
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) => new AlertDialog(
                                                content: Builder(
                                                  builder: (context) {
                                                    var height = MediaQuery.of(context).size.height;
                                                    var width = MediaQuery.of(context).size.width;

                                                    return Container(
                                                        height: height - 550,
                                                        width: width - 370,
                                                        child: Column(
                                                          children: <Widget> [
                                                            Lottie.network('https://assets7.lottiefiles.com/packages/lf20_pvcspyef.json',
                                                                            width: 100,height: 100),
                                                            Text(
                                                              'Are you sure you want to delete this prescription.',
                                                            ),
                                                            Container(
                                                              height: 30,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                RaisedButton(
                                                                  color: Colors.purple,
                                                                  onPressed: () {
                                                                    FirebaseFirestore.instance.collection('$_emailId saves').doc(document.id).delete();
                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SucessFullScreen()));
                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Delete',
                                                                      style: TextStyle(
                                                                        fontSize: 16,
                                                                        fontWeight: FontWeight.bold,
                                                                        color: Colors.white
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                // ignore: deprecated_member_use
                                                                RaisedButton(
                                                                  color: Colors.white70,
                                                                  onPressed: () {

                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Cancel',
                                                                      style: TextStyle(
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.bold,
                                                                          color: Colors.grey
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                    );
                                                  },
                                                ),
                                              )
                                          );
                                        }),
                              ),
                              Container(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(height: 20)
                ]
                  ),
              );
            }).toList()
          );
        },
      ),
    );
  }
}
