import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:vsports/Booking_Pages/badmintonbooking.dart';
import 'package:vsports/Booking_Pages/basketballbooking.dart';
import 'package:vsports/Booking_Pages/carromsbooking.dart';
import 'package:vsports/Booking_Pages/chessbooking.dart';
import 'package:vsports/Booking_Pages/cricketbooking.dart';
import 'package:vsports/Booking_Pages/footballbooking.dart';
import 'package:vsports/Booking_Pages/ttbooking.dart';
import 'package:vsports/Booking_Pages/volleyball.dart';
import 'package:vsports/homeone.dart';
import 'package:vsports/list.dart';
import 'package:vsports/login.dart';
import 'package:vsports/ongoingsport.dart';
import 'package:vsports/profile.dart';

class Homepage extends StatefulWidget {
  var regno;
  var name;
  var email;
  Homepage({super.key, this.regno, this.name,this.email});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selindex = 0;

  late List<Widget> screens = [
    Homeonepage(regno: widget.regno),
    Ongoingpage(
      regno: widget.regno,
    ),
    Profilepage(
      regno: widget.regno,
      email: widget.email,
      name: widget.name,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GNav(
              gap: 8,
              tabBorderRadius: 300,
              tabBackgroundColor: Colors.grey.shade800,
              padding: const EdgeInsets.all(15),
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                GButton(
                    icon: Icons.home,
                    iconColor: Colors.white,
                    iconActiveColor: Colors.blue,
                    iconSize: 25,
                    text: 'Home',
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        selindex = 0;
                      });
                    }),
                GButton(
                    icon: Icons.play_circle,
                    iconColor: Colors.white,
                    iconActiveColor: Colors.blue,
                    iconSize: 25,
                    text: 'Ongoing',
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        selindex = 1;
                      });
                    }),
                GButton(
                    icon: Icons.person,
                    iconColor: Colors.white,
                    iconActiveColor: Colors.blue,
                    iconSize: 25,
                    text: 'Profile',
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        selindex = 2;
                      });
                    })
              ]),
        ),
        backgroundColor: Colors.black,
        body: screens[selindex]);
  }
}
