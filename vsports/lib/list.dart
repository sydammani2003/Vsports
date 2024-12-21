import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Customlist extends StatefulWidget {
  final String sport;
  final String imagepath;
  final String desc;
  final double h;
  final double w;
  const Customlist(
      {super.key,
      required this.sport,
      required this.desc,
      required this.h,
      required this.w,
      required this.imagepath});

  @override
  State<Customlist> createState() => _CustomlistState();
}

class _CustomlistState extends State<Customlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(8),
        width: widget.w,
        height: widget.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: Colors.grey.shade800),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 80, width: 80, child: Lottie.network(widget.imagepath)),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.sport,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              widget.desc,
              style: TextStyle(color: Colors.white, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
