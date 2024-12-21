import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vsports/homepage.dart';
import 'package:vsports/ongoingsport.dart';

class Nothingongoingpage extends StatefulWidget {
  const Nothingongoingpage({super.key});

  @override
  State<Nothingongoingpage> createState() => _NothingongoingpageState();
}

class _NothingongoingpageState extends State<Nothingongoingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
            child: Lottie.network(
                'https://lottie.host/60325ebc-b14b-4ac7-a6d6-44170b655d64/0aobIBwOuj.json')),
      ),
    );
  }
}
