import 'package:health_bloom/constant.dart';
import 'package:health_bloom/covidresources/covidfacts.dart';
import 'package:health_bloom/covidresources/covidvaccinefacts.dart';
import 'package:health_bloom/covidresources/liveIndiaCovidCases.dart';
import 'package:health_bloom/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Get to know",
              textBottom: "About Covid-19.",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Symptoms",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "Headache",
                          isActive: true,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        SymptomCard(
                          image: "assets/images/caugh.png",
                          title: "Caugh",
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        SymptomCard(
                          image: "assets/images/fever.png",
                          title: "Fever",
                        ),
                        SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Prevention", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PreventCard(
                    text:
                    "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                    image: "assets/images/wear_mask.png",
                    title: "Wear face mask",
                  ),
                  PreventCard(
                    text:
                    "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                    image: "assets/images/wash_hands.png",
                    title: "Wash your hands",
                  ),
                  Text("Resources", style: kTitleTextstyle),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CovidVaccineFacts()));
                        },
                        child: ResCard(
                          image: 'https://image.flaticon.com/icons/png/512/2760/2760383.png',
                          title: 'Covid Vaccine Facts',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CovidFacts()));
                        },
                        child: ResCard(
                          image: 'https://www.ipserv.co.uk/wp-content/uploads/2020/06/250x400-COVID-19-BLU.png',
                          title: 'Covid-19 Facts',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => India()));
                      },
                      child: ResCard(
                        image: 'https://images.squarespace-cdn.com/content/v1/5572b7b4e4b0a20071d407d4/1540925980206-IVMMGCH0BDY5IYYNXATP/ke17ZwdGBToddI8pDm48kGfiFqkITS6axXxhYYUCnlRZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpxQ1ibo-zdhORxWnJtmNCajDe36aQmu-4Z4SFOss0oowgxUaachD66r8Ra2gwuBSqM/case-study-icon.png',
                        title: 'Live Covid Cases',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const ResCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
              : BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: kShadowColor,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.network(image, height: 90),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
              : BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: kShadowColor,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
