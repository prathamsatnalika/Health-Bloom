import 'package:flutter/material.dart';
import 'package:health_bloom/userscreens/home.dart';
import 'package:health_bloom/sidedrawer/drawer_screen.dart';

class HomeScreenWithDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            Nav(),

          ],
      ),
    );
  }
}
