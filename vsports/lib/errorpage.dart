import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vsports/homepage.dart';
import 'package:vsports/ongoingsport.dart';

class Errorpage extends StatefulWidget {
  var regno;
  Errorpage({super.key,this.regno});

  @override
  State<Errorpage> createState() => _ErrorpageState();
}

class _ErrorpageState extends State<Errorpage> {
  void apple() {
    Future.delayed(
        Duration(milliseconds: 4000),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Homepage(
                      regno: widget.regno,
                    ))));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      apple();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
            child: Lottie.network(
                'https://lottie.host/8ecc0c0b-fbc6-42be-90ce-f8c66bc18367/gvSrBlf8Xe.json')),
      ),
    );
  }
}
