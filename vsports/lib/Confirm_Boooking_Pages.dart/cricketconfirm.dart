import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:vsports/confirmationpage.dart';
import 'package:vsports/errorpage.dart';
import 'package:vsports/homepage.dart';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:vsports/link.dart';

class Cricketconfirmbooking extends StatefulWidget {
  var bat;
  var ball;
  var timeslot;
  var regno;
  Cricketconfirmbooking(
      {super.key, this.ball, this.bat, this.timeslot, this.regno});

  @override
  State<Cricketconfirmbooking> createState() => _CricketconfirmbookingState();
}

class _CricketconfirmbookingState extends State<Cricketconfirmbooking> {
  cricbook(bat, ball, regno) async {
    try {
      // Create an HttpClient that ignores SSL certificate errors
      var httpClient = HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      var ioClient = IOClient(httpClient);

      var response = await ioClient.post(
        Uri.parse('https://${ngrok_link}/api/book_cricket/'),
        body: {
          'reg_no': regno,
          'no_of_bats': bat.toString(),
          'no_of_balls': ball.toString()
        },
      );

      var data = jsonDecode(response.body);
      if (data['message'] == 'Cricket booking successful!') {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Confirmationpage(
            regno: regno,
          );
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Errorpage(
            regno: regno,
          );
        }));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data['error'])));

        print('Unexpected response: $data');
      }
    } catch (e) {
      print('Error during API call: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Booking Confirmation",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      height: 30,
                      width: 30,
                      child: Lottie.network(
                          'https://lottie.host/ec212db6-0ab1-459a-875c-98d9a82bc855/7G6NI6deGz.json'))
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Column(children: [
                Text(
                  "Review your booking details",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 370,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade800),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                              height: 80,
                              width: 80,
                              child: Lottie.network(
                                  'https://lottie.host/83cc5e89-fea1-4dc1-bca2-d14d998b2283/T8CrOVnSaO.json')),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sport",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Cricket",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                              height: 80,
                              width: 80,
                              child: Lottie.network(
                                  'https://lottie.host/9793c778-95d2-4e1e-871e-2cb7fa5c09d5/b4wk6aYyMY.json')),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Equipment",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                '${widget.bat} Bat ${widget.ball} Ball',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                              height: 80,
                              width: 80,
                              child: Lottie.network(
                                  'https://lottie.host/8d57bec2-6a59-44b3-9e29-26aa94c0fd37/pDFwMZlTH3.json')),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Time Slot",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "${widget.timeslot}",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                              height: 80,
                              width: 80,
                              child: Lottie.network(
                                  'https://lottie.host/de9c4693-fe9d-48df-9174-cb716a457dd8/ZkRBgiAt2C.json')),
                          SizedBox(
                            width: 7,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Players",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "You",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ])),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cricbook(widget.bat, widget.ball, widget.regno);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 80),
                  ),
                  child: const Text(
                    'Confirm Booking',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Homepage(
                                  regno: widget.regno,
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
                  ),
                  child: const Text(
                    'Back to Sports Selection',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
