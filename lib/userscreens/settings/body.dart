import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom/SettingsPackages/help.dart';
import 'package:health_bloom/SettingsPackages/profile.dart';
import 'package:health_bloom/screens/resetpassword.dart';
import 'package:health_bloom/userscreens/signout.dart';
import 'package:wiredash/wiredash.dart';
import 'profile_menu.dart';

var _emailId = FirebaseAuth.instance.currentUser.email;

class MainSettings extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Wiredash(
        projectId: 'healthbloom-0si5qfu',
        secret: 'vc8mueaveodugysoax1rnfm2nvcgh49jqv2tactan2b7587s',
        navigatorKey: _navigatorKey,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: _navigatorKey,
          home: ProfilePage(),
    )
    );
  }
}


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  var _name  = '';
  var _lastName = '';
  var _profile = '';

  void getDetails() {
    FirebaseFirestore.instance
        .collection("users")
        .where("Email", isEqualTo: _emailId)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        setState(() {
          _name = result.data()['First_Name'];
          _lastName = result.data()['Last_Name'];
          _profile = result.data()['Profile_pic'];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getDetails();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                       _profile
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$_name $_lastName",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                        _emailId,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ],
            ),
            //ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "Edit Account",
              icon: "https://cdn0.iconfinder.com/data/icons/glyphpack/45/edit-alt-512.png",
              press: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsUI()))
              },
            ),
            ProfileMenu(
              text: "Change Password",
              icon: "https://cdn1.iconfinder.com/data/icons/web-programming-misc/80/change_password-reset_password-new_password-Forgot_password-512.png",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResetScreen()));
              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "https://img.icons8.com/ios/452/help.png",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HelpSupport()));
              },
            ),
            ProfileMenu(
              text: "Feedback",
              icon: "https://static.thenounproject.com/png/2920442-200.png",
              press: () {
                Wiredash.of(context).show();
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "https://cdn.icon-icons.com/icons2/2518/PNG/512/logout_icon_151219.png",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignOutScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
