import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  var _emailId = FirebaseAuth.instance.currentUser.email;

  File _image;
  final imagePicker = ImagePicker();
  Map data;
  String _imageLink = '';

  var userprofile = '';


  final TextEditingController _First_Name = TextEditingController();
  final TextEditingController _Last_Name = TextEditingController();
  final TextEditingController _Phone_no = TextEditingController();
  final TextEditingController _Gender = TextEditingController();

  void getDetails() {
    FirebaseFirestore.instance
        .collection("users")
        .where("Email", isEqualTo: _emailId)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        setState(() {
          userprofile = result.data()['Profile_pic'];
        });
      });
    });
  }

  Future getImage() async{
    final image = await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
    print(_image);
  }

  void _uploadProfile() {
    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageReference = FirebaseStorage.instance.ref()
        .child('Profile').child(imageFileName);
    final UploadTask uploadTask = storageReference.putFile(_image);

    uploadTask.then((TaskSnapshot taskSnapshot){
      taskSnapshot.ref.getDownloadURL().then((imageUrl){
        setState(() {
          _imageLink = imageUrl;
        });
        print(_imageLink);
        updateUser();
      });
    }).catchError((error){

    });
  }

  Future<void> updateUser() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        .doc(_emailId)
        .update({
          'First_Name': _First_Name.text,
          'Last_Name' : _Last_Name.text,
          'Gender' : _Gender.text,
          'Phone_no' : _Phone_no.text,
          'Profile_pic' : _imageLink.toString()
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    getDetails();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                userprofile
                              )
                          )
                      )
                      ,
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
                            color: Colors.deepPurpleAccent,
                          ),
                          child: InkWell(
                            onTap: () {
                              getImage();
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
              SizedBox(
                height: 35,
              ),
              buildTextField(_First_Name,"First Name", "", false),
              buildTextField(_Last_Name,"Last Name", "", false),
              buildTextField(_Gender,"Gender", "", false),
              buildTextField(_Phone_no,"Phone Number", "", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    height: 50,
                    child: OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      child: Text("CANCEL",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black)),
                    ),
                  ),

                  Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        _uploadProfile();
                      },
                      color: Colors.deepPurpleAccent,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController control , String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: control,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: 20
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}