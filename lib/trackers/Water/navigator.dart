import 'package:flutter/material.dart';
import 'package:health_bloom/trackers/Water/watertracker.dart';
import 'history.dart';

class WaterNav extends StatefulWidget {
  @override
  _WaterNavState createState() => _WaterNavState();
}

class _WaterNavState extends State<WaterNav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    WaterTracker(),
    WaterTrackerHistory(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(126, 130, 237,1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            title: Text(
              'History',
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}