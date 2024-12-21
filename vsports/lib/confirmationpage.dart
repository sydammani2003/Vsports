import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:vsports/homepage.dart';
import 'package:vsports/ongoingsport.dart';

class Confirmationpage extends StatefulWidget {
  var regno;
  Confirmationpage({super.key, this.regno});

  @override
  State<Confirmationpage> createState() => _ConfirmationpageState();
}

class _ConfirmationpageState extends State<Confirmationpage> {
  void apple() {
    
    Future.delayed(
        Duration(milliseconds: 4100),
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
    apple(); // Call `apple()` after widget tree is built
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
            child: Lottie.network(
                'https://lottie.host/92fa5e71-125e-4719-bd34-d684a6880db8/LtKLDihNNb.json')),
      ),
    );
  }
}
