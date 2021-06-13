import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SucessFullScreen extends StatefulWidget {
  const SucessFullScreen({Key key}) : super(key: key);

  @override
  _SucessFullScreenState createState() => _SucessFullScreenState();
}

class _SucessFullScreenState extends State<SucessFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70,
          ),
          Lottie.network('https://assets5.lottiefiles.com/private_files/lf30_owOYBr.json',repeat: false,
                          width:350,height: 350),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 400,
            alignment: Alignment.center,
            child: Text(
              'You have successfully deleted',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20
              ),
            ),
          ),
          Container(
            width: 400,
            alignment: Alignment.center,
            child: Text(
              'Prescription!',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20
              ),
            ),
          ),
          Container(
            height: 130,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 190,
              height: 60,
              child: FlatButton(
                color: Color.fromRGBO(124, 229, 163,1),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text(
                        'Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
