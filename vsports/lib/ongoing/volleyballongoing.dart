import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vsports/list.dart';

import 'package:slide_countdown/slide_countdown.dart';

class Volleyballongoingpage extends StatefulWidget {
  Volleyballongoingpage({super.key});

  @override
  State<Volleyballongoingpage> createState() => _VolleyballongoingpageState();
}

class _VolleyballongoingpageState extends State<Volleyballongoingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 370,
                    width: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade800)),
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
                                    'https://lottie.host/5d353057-d17c-4780-9027-eedc847fc7ac/gwGP9TNFPt.json')),
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
                                  "Volleyball",
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
                                  "2 balls",
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
                                  "4:00 PM - 5:00 PM",
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
                                Row(
                                  children: [
                                    Text(
                                      "You",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 200,
                    child: SlideCountdownSeparated(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 106, 3, 115),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(7),
                      duration: Duration(minutes: 40),
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )));
  }
}
