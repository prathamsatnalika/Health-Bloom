import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class Medshops extends StatefulWidget {
  const Medshops({Key key}) : super(key: key);

  @override
  _MedshopsState createState() => _MedshopsState();
}

class _MedshopsState extends State<Medshops> {

  _launchURLApp() async {
    const url = 'https://www.geeksforgeeks.org/';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(234, 243, 250,1),
        body: ListView(
          children: [
            Column(
              children: [
                Container(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Container(width: 30),
                    InkWell(
                      onTap: () {Navigator.pop(context);},
                      child: Icon(Icons.arrow_back_ios_outlined),
                    )
                  ],
                ),
                Container(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: 350,
                    height: 400,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(height: 20),
                        Image.network('https://alphafirms.in/wp-content/uploads/2020/12/MedLife-logo.png',
                                      height: 100,width: 100),
                        Container(height: 20),
                        Container(
                          width: 310,
                          height: 200,
                          child: Text('Medlife International, is an India online platform, which provides pharmacy, diagnostics, and e-consultation in India. It was founded in 2014 by Prashant Singh and Tushar Kumar. The company has acentral laboratory based in Bengaluru and delivers daily to 29 states in India',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      )),
                        ),
                        Container(height: 10,),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: 350,
                    height: 400,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(height: 20),
                        Image.network('https://entrackr.com/wp-content/uploads/2018/03/pharmeasy-image.jpg',
                            height: 100,width: 100),
                        Container(height: 20),
                        Container(
                          width: 310,
                          height: 200,
                          child: Text("PharmEasy is one of India's most trusted online pharmacy & medicalstores offering pharmaceutical and healthcare products states. PharmEasy provides Superfast Delivery of Medicines in All Corners of India. Same Day Delivery Available.",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                        Container(height: 10,),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: 350,
                    height: 350,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(height: 20),
                        Image.network('https://s3.amazonaws.com/tracxn-data-image/logo/company/1dd7938954b1607ce3a49f19b36a840',
                            height: 100,width: 100),
                        Container(height: 20),
                        Container(
                          width: 310,
                          height: 200,
                          child: Text('1mg.com is a online medical Shop that alllows you to Access all Your Health Care Needs at Best Prices. Trusted By 25 Million+People. Smartest Way To Get Quality Tested Medicines at BestPrice. Save Now!',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                        Container(height: 10,),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
