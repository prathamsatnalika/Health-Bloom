import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_bloom/BottomTabScreens/Home/components/category_card.dart';
import 'package:health_bloom/BottomTabScreens/Home/components/doctor_card.dart';
import 'package:health_bloom/BottomTabScreens/Home/constant.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom/BottomTabScreens/Trackers/home.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_bloom/covidresources/home.dart';
import 'package:health_bloom/trackers/HeartRate/bpm.dart';
import 'package:health_bloom/userscreens/BMI/home.dart';
import 'package:health_bloom/userscreens/bmi.dart';
import 'package:health_bloom/userscreens/discover.dart';
import 'package:health_bloom/userscreens/exercises.dart';
import 'package:health_bloom/userscreens/joggingtimer.dart';
import 'package:health_bloom/userscreens/onlinemedshops.dart';
import 'package:health_bloom/userscreens/prescriptions.dart';
import 'package:health_bloom/userscreens/savepresciption.dart';
import 'package:health_bloom/userscreens/settings/body.dart';
import 'package:health_bloom/userscreens/signout.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _emailId = FirebaseAuth.instance.currentUser.email;
  var _name = '';
  var _profile = '';
  var _auth = FirebaseAuth.instance.currentUser.toString();

  void getDetails() {
    FirebaseFirestore.instance
        .collection("users")
        .where("Email", isEqualTo: _emailId)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        setState(() {
          _name = result.data()['First_Name'];
          _profile = result.data()['Profile_pic'];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getDetails();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: Builder(builder: (context) => // Ensure Scaffold is in context
        IconButton(
          iconSize: 35,
          icon: Icon(Icons.list,color: kTitleTextColor,),
          onPressed: () => Scaffold.of(context).openDrawer(),
          padding: EdgeInsets.symmetric(horizontal: 25),
        ),
      )),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(126, 130, 237,1),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(_profile)),
                accountName: Text(_name,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                )),
                accountEmail: Text(
                  "$_emailId",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            ListTile(
              title: Text('Save Prescriptions'),
              leading: Icon(Icons.my_library_books_sharp),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SavePres()));
              },
            ),
            ListTile(
              title: Text('Your Prescriptions'),
              leading: Icon(Icons.my_library_books_sharp),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AllPrecriptions()));
              },
            ),
            Divider(
              color: Colors.black54,
              height: 15,
              thickness: 2,
            ),
            ListTile(
              title: Text('Different Exercises'),
              leading: FaIcon(FontAwesomeIcons.running),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Exercises()));
              },
            ),
            ListTile(
              title: Text('Best Online Medicines Shop'),
              leading: FaIcon(FontAwesomeIcons.shoppingCart),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Medshops()));
              },
            ),
            ListTile(
              title: Text('Covid Resources'),
              leading: FaIcon(FontAwesomeIcons.virus),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen()));
              },
            ),
            Divider(
              color: Colors.black54,
              height: 15,
              thickness: 2,
            ),
            ListTile(
              title: Text('BMI Calculator'),
              leading: FaIcon(FontAwesomeIcons.calculator),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BmiCal()));
              },
            ),
            ListTile(
              title: Text('Health Tracker'),
              leading: FaIcon(FontAwesomeIcons.heart),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TrackerScreenHome()));
              },
            ),
            ListTile(
              title: Text('Jogging Timer'),
              leading: FaIcon(FontAwesomeIcons.stopwatch),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TimerPage()));
              },
            ),
            Divider(
              color: Colors.black54,
              height: 15,
              thickness: 2,
            ),
            ListTile(
              title: Text('Account Profile'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignOutScreen()));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // InkWell(
              //   onTap: () => Scaffold.of(context).openDrawer(),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 30),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: <Widget>[
              //         SvgPicture.asset('assets/icons/menu.svg'),
              //       ],
              //     ),
              //   ),
              // ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Hi $_name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Here's some suggestion for You",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildCategoryList(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Top Rated',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildDoctorList(),
            ],
          ),
        ),
      ),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AllPrecriptions()));
            },
            child: CategoryCard(
              'Prescriptions',
              'assets/icons/medical-prescription.png',
              kBlueColor,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TimerPage()));
            },
            child: CategoryCard(
              'Jogging timer',
              'images/images.png',
              kYellowColor,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Exercises()));
            },
            child: CategoryCard(
              'Different\nExercises',
              'assets/icons/exercises.png',
              kOrangeColor,
            ),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }

  buildDoctorList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SavePres()));
            },
            child: DoctorCard(
              'Save Prescriptions',
              'All your Prescriptions would we saved saved securely',
              'assets/images/doctor1.png',
              kBlueColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BmiCal()));
            },
            child: DoctorCard(
              'Calculate Your BMI',
              'Know you are over weighed or under weighted by just Simple Steps',
              'assets/images/doctor2.png',
              kYellowColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen()));
            },
            child: DoctorCard(
              'Covid Resources',
              'Know about covid, live cases etc',
              'assets/images/doctor3.png',
              kOrangeColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
