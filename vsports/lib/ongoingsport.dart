import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:vsports/list.dart';
import 'package:vsports/nothingongoing.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:vsports/ongoing/badmintonongoing.dart';
import 'package:vsports/ongoing/basketballongoing.dart';
import 'package:vsports/ongoing/carromongoing.dart';
import 'package:vsports/ongoing/chessongoing.dart';
import 'package:vsports/ongoing/cricketongoing.dart';
import 'package:vsports/ongoing/footballongoing.dart';
import 'package:vsports/ongoing/tabletennisongoing.dart';
import 'package:vsports/ongoing/volleyballongoing.dart';

// ignore: must_be_immutable
class Ongoingpage extends StatefulWidget {
  var regno;

  Ongoingpage({super.key, this.regno});

  @override
  State<Ongoingpage> createState() => _OngoingpageState();
}

class _OngoingpageState extends State<Ongoingpage> {
  List<Widget> screensongoing = [
    Cricketongoingpage(),
    Badmintonongoingpage(),
    Volleyballongoingpage(),
    Basketballongoingpage(),
    Footballongoingpage(),
    Chessongoingpage(),
    Carromongoingpage(),
    Tabletennisongoingpage()
  ];
  var a = false;
  int selectedindex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: a
            ? const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Nothingongoingpage(),
                ),
              )
            : Padding(
                padding: EdgeInsets.all(16),
                child: screensongoing[selectedindex],
              ));
  }
}
