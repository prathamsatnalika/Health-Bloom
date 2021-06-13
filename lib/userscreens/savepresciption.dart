import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_bloom/userscreens/home.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class SavePres extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  final imagePicker = ImagePicker();

  String _imageLink = '';

  var _emailId = FirebaseAuth.instance.currentUser.email;
  Map data;

  final TextEditingController _patientName = TextEditingController();
  final TextEditingController _doctorName= TextEditingController();

  String _patient = '';
  String _doctor = '';

  Future getImage() async{
    final image = await imagePicker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image.path);
    });
    print(_image);
  }

  // ignore: non_constant_identifier_names
  void _UploadImage() {
    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageReference = FirebaseStorage.instance.ref()
        .child('Images').child(imageFileName);
    final UploadTask uploadTask = storageReference.putFile(_image);

    uploadTask.then((TaskSnapshot taskSnapshot){
      taskSnapshot.ref.getDownloadURL().then((imageUrl){
        setState(() {
          _imageLink = imageUrl;
        });
        print(_imageLink);
        saveData();
      });
    }).catchError((error){

    });
  }

  saveData() {
    Map<String,dynamic> PrescriptionData = {
      "Doctor_Name" : _doctorName.text,
      "Patient_Name" : _patientName.text,
      "Image_URL" : _imageLink.toString(),
      "Email" : _emailId.toString(),
    };
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('$_emailId saves');
    collectionReference.add(PrescriptionData)
    .then((value) => {
      Fluttertoast.showToast(
        msg: "Saved Prescription",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0,
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromRGBO(234, 243, 250,1),
            body: SingleChildScrollView(
                child: Container(
                    child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget> [
                              Container(width: 30),
                              InkWell(
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Nav()));},
                                child: Icon(Icons.arrow_back_ios_outlined),
                              )
                            ],
                          ),
                          Lottie.network('https://assets6.lottiefiles.com/packages/lf20_bYEwvM.json',
                                        height: 300,width: 300),

                           Container(
                             width: 350,
                             child: Text(
                               'Take Picture of prescription and fill the details',
                               style: TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold
                               ),
                             ),
                           ),

                           Container(
                             height: 30,
                           ),

                           Container(
                             width: 350,
                             child: TextFormField(
                               controller: _patientName,
                              decoration: new InputDecoration(
                                labelText: "Patient's Name",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                              ),
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                          ),
                           ),

                          Container(height: 20,),

                          Container(
                            width: 350,
                            child: TextFormField(
                              controller: _doctorName,
                              decoration: new InputDecoration(
                                labelText: "Doctor's Name",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                              ),
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),

                          Container(
                            height: 30,
                          ),

                          Container(
                              width: 300,
                              height: 50,
                              child: RaisedButton(
                                onPressed: () {
                                  _UploadImage();
                                },
                                color: Color.fromRGBO(86, 105, 255,1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("Submit",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700
                                ),),
                              )),

                                Container(
                                  height: 40,
                                ),
                        ]
                    )
                )
            ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              getImage();
            },

            child: const Icon(Icons.camera_alt),
            backgroundColor: Color.fromRGBO(86, 105, 255,1),
          ),


        )
    );
  }
}