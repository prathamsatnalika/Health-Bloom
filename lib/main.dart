import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:health_bloom/BottomTabScreens/Home/home.dart';
import 'package:health_bloom/SettingsPackages/profile.dart';
import 'package:health_bloom/covidresources/home.dart';
import 'package:health_bloom/covidresources/liveIndiaCovidCases.dart';
import 'package:health_bloom/screens/authentication_service.dart';
import 'package:health_bloom/screens/resetpassword.dart';
import 'package:health_bloom/splashscreen/secondsplash.dart';
import 'package:health_bloom/trackers/HeartRate/bpm.dart';
import 'package:health_bloom/trackers/Step/step_tracker.dart';
import 'package:health_bloom/trackers/Water/navigator.dart';
import 'package:health_bloom/userscreens/BMI/home.dart';
import 'package:health_bloom/userscreens/onlinemedshops.dart';
import 'package:health_bloom/userscreens/prescriptions.dart';
import 'package:health_bloom/userscreens/signout.dart';
import 'package:health_bloom/userscreens/sucessfull.dart';
import 'package:lottie/lottie.dart';
import 'package:health_bloom/BottomTabScreens/Trackers/home.dart';
import 'package:health_bloom/screens/login.dart';
import 'package:health_bloom/screens/signup.dart';
import 'package:health_bloom/userscreens/home.dart';
import 'package:health_bloom/userscreens/bmi.dart';
import 'package:health_bloom/userscreens/exercises.dart';
import 'package:health_bloom/splashscreen/firstsplash.dart';
import 'package:health_bloom/userscreens/settings/body.dart';
import 'package:health_bloom/userscreens/discover.dart';
import 'package:health_bloom/covidresources/covidfacts.dart';
import 'package:health_bloom/covidresources/covidvaccinefacts.dart';
import 'package:health_bloom/trackers/Water/watertracker.dart';
import 'package:health_bloom/userscreens/covidresources.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:health_bloom/userscreens/savepresciption.dart';
import 'package:health_bloom/userscreens/joggingtimer.dart';

import 'SettingsPackages/feedback.dart';
import 'SettingsPackages/help.dart';

 Future <void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
        create: (_) => AuthenticationService(FirebaseAuth.instance),
     ),
      StreamProvider(
        create: (context) => context.read<AuthenticationService>().authStateChanges,
      ),
      ],
        child: MaterialApp(
          title: 'Health Bloom',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(),
    ),
    );
  }
}

class MyHomePage extends StatelessWidget {
    const MyHomePage({ Key key,}): super(key: key);
    @override
    Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null){
      return Nav();
    }
      return Splash1();
    }
 }






