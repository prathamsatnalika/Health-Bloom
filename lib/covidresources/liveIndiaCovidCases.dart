import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {

  final String url = "https://api.rootnet.in/covid19-in/stats/latest";
  Future <List>  datas;
  Future <List>  getData() async {
    var response = await Dio().get(url);
    return response.data['data']['regional'];
  }

  @override
  void initState() {
    super.initState();
    datas = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Live Covid Cases',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
            backgroundColor: Colors.purple[400]
        ),
        body: Container(
            padding: EdgeInsets.all(30),
            child: FutureBuilder(
                future: datas,
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.hasData) {
                    print(snapshot.data);
                    return  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0
                      ),
                      itemCount: 36,
                      itemBuilder: (BuildContext context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            color: Colors.purple[200],
                            child : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children : <Widget>[
                                  Center(
                                    child: Container(
                                      color: Colors.purple[400],
                                      width: 200,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(snapshot.data[index]['loc'],style: TextStyle(
                                              fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Cases:${snapshot.data[index]['totalConfirmed'].toString()}',
                                    style: TextStyle(color: Colors.white),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Discharged:${snapshot.data[index]['discharged'].toString()}',
                                    style: TextStyle(color: Colors.white),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Deaths:${snapshot.data[index]['deaths'].toString()}',
                                    style: TextStyle(color: Colors.white),),

                                ]
                            )

                        ),
                      )
                  );



                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                }
            )
        )
    );
  }
}