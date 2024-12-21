import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/io_client.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:vsports/Booking_Pages/badmintonbooking.dart';
import 'package:vsports/Booking_Pages/basketballbooking.dart';
import 'package:vsports/Booking_Pages/carromsbooking.dart';
import 'package:vsports/Booking_Pages/chessbooking.dart';
import 'package:vsports/Booking_Pages/cricketbooking.dart';
import 'package:vsports/Booking_Pages/footballbooking.dart';
import 'package:vsports/Booking_Pages/ttbooking.dart';
import 'package:vsports/Booking_Pages/volleyball.dart';
import 'package:vsports/link.dart';
import 'package:vsports/list.dart';
import 'package:vsports/login.dart';
import 'package:vsports/ongoingsport.dart';
import 'package:vsports/superuserlist.dart';
import 'package:vsports/superusersport.dart';

var available = 'Load..';
var booked = 'Load..';

class Superuserhomepage extends StatefulWidget {
  var regno;
  Superuserhomepage({super.key, this.regno});

  @override
  State<Superuserhomepage> createState() => _SuperuserhomepageState();
}

class _SuperuserhomepageState extends State<Superuserhomepage> {
  void inventory(regno, gametype) async {
    try {
      // Create an HttpClient that ignores SSL certificate errors
      var httpClient = HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      var ioClient = IOClient(httpClient);

      var response = await ioClient.post(
        Uri.parse('https://${ngrok_link}/api/view_inventory/'),
        body: {'reg_no': regno.toString()},
      );

      var data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        if (gametype == 'cricket_bookings') {
          available = data['data']['total_no_of_cricket_bats'];
          booked = data['data']['available_cricket_bats'];
        } else if (gametype == 'volleyball_booking') {
          available = data['data']['total_no_of_volleyballs'];
          booked = data['data']['available_volleyballs'];
        } else if (gametype == 'Basketball_booking') {
          available = data['data']['total_no_of_basketballs'];
          booked = data['data']['available_basketballs'];
        } else if (gametype == 'Football_booking') {
          available = data['data']['total_no_of_footballs'];
          booked = data['data']['available_footballs'];
        } else if (gametype == 'Chess_booking') {
          available = data['data']['total_no_of_chessboards'];
          booked = data['data']['available_chessboards'];
        } else if (gametype == 'Carroms_booking') {
          available = data['data']['total_no_of_carrom_boards'];
          booked = data['data']['available_carrom_boards'];
        }
      } else {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Administrator",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen())),
                    child: Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                      size: 25,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 170,
                          width: 170,
                          child: InkWell(
                            onTap: () {
                              inventory(widget.regno, "cricket_bookings");

                              context.read<Needed>().backend(
                                  widget.regno.toString(), "cricket_bookings");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Loading the data..."),
                                duration: Duration(seconds: 3),
                              ));
                              Future.delayed(
                                  Duration(seconds: 3),
                                  () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Superusersportpage(
                                                regno: widget.regno,
                                                imagepath:
                                                    'https://lottie.host/83cc5e89-fea1-4dc1-bca2-d14d998b2283/T8CrOVnSaO.json',
                                                sport: 'Cricket',
                                                available: available,
                                                booked: booked,
                                              ))));
                            },
                            child: Customlist(
                              sport: 'Cricket',
                              h: 170,
                              w: 180,
                              imagepath:
                                  'https://lottie.host/83cc5e89-fea1-4dc1-bca2-d14d998b2283/T8CrOVnSaO.json',
                              desc: 'Hit Boundaries, Chase Victory Today...',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 170,
                          width: 170,
                          child: InkWell(
                            onTap: () {},
                            child: Customlist(
                                sport: 'Badminton',
                                h: 170,
                                w: 180,
                                imagepath:
                                    'https://lottie.host/e6cafe03-6ab4-4c21-a3e5-4349777e1351/zAdpLoPMur.json',
                                desc: 'Smash Hard, Play to Win...'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 170,
                          width: 170,
                          child: InkWell(
                            onTap: () {
                              inventory(widget.regno, "volleyball_booking");
                              context.read<Needed>().backend(
                                  widget.regno.toString(),
                                  "volleyball_booking");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Loading the data..."),
                                duration: Duration(seconds: 3),
                              ));
                              Future.delayed(
                                  Duration(seconds: 3),
                                  () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Superusersportpage(
                                                regno: widget.regno,
                                                imagepath:
                                                    'https://lottie.host/5d353057-d17c-4780-9027-eedc847fc7ac/gwGP9TNFPt.json',
                                                sport: 'Volleyball',
                                                available: available,
                                                booked: booked,
                                              ))));
                            },
                            child: Customlist(
                              sport: 'Volleyball',
                              h: 170,
                              w: 180,
                              imagepath:
                                  'https://lottie.host/5d353057-d17c-4780-9027-eedc847fc7ac/gwGP9TNFPt.json',
                              desc: 'Spike High, Soar to Victory...',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 170,
                          width: 170,
                          child: InkWell(
                            onTap: () {
                              inventory(widget.regno, "Basketball_booking");
                              context.read<Needed>().backend(
                                  widget.regno.toString(),
                                  "Basketball_booking");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Loading the data..."),
                                duration: Duration(seconds: 3),
                              ));
                              Future.delayed(
                                  Duration(seconds: 3),
                                  () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Superusersportpage(
                                                regno: widget.regno,
                                                imagepath:
                                                    'https://lottie.host/d50e6f74-1be7-42c9-8dba-2c4df2f2592b/56KLq7Nwzb.json',
                                                sport: 'Basketball',
                                                available: available,
                                                booked: booked,
                                              ))));
                            },
                            child: Customlist(
                              sport: 'Basketball',
                              h: 170,
                              w: 180,
                              imagepath:
                                  'https://lottie.host/d50e6f74-1be7-42c9-8dba-2c4df2f2592b/56KLq7Nwzb.json',
                              desc: 'Dribble, Shoot, Score Big Wins...',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 170,
                          width: 170,
                          child: InkWell(
                            onTap: () {
                              inventory(widget.regno, "Football_booking");
                              context.read<Needed>().backend(
                                  widget.regno.toString(), "Football_booking");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Loading the data..."),
                                duration: Duration(seconds: 3),
                              ));
                              Future.delayed(
                                  Duration(seconds: 3),
                                  () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Superusersportpage(
                                                regno: widget.regno,
                                                imagepath:
                                                    'https://lottie.host/56148833-6f76-4c6b-acba-54f83e52a27c/WQSJNAJWbM.json',
                                                sport: 'Football',
                                                available: available,
                                                booked: booked,
                                              ))));
                            },
                            child: Customlist(
                              sport: 'Football',
                              h: 170,
                              w: 180,
                              imagepath:
                                  'https://lottie.host/56148833-6f76-4c6b-acba-54f83e52a27c/WQSJNAJWbM.json',
                              desc: 'Kick Hard, Score Your Glory...',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 170,
                          width: 170,
                          child: InkWell(
                            onTap: () {
                              inventory(widget.regno, "Chess_booking");
                              context.read<Needed>().backend(
                                  widget.regno.toString(), "Chess_booking");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Loading the data..."),
                                duration: Duration(seconds: 3),
                              ));
                              Future.delayed(
                                  Duration(seconds: 3),
                                  () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Superusersportpage(
                                                regno: widget.regno,
                                                imagepath:
                                                    'https://lottie.host/71ca47b4-3a8a-4ec2-88bc-a9a926d1c433/fR0ozvepu7.json',
                                                sport: 'Chess',
                                                available: available,
                                                booked: booked,
                                              ))));
                            },
                            child: Customlist(
                              sport: 'Chess',
                              h: 170,
                              w: 180,
                              imagepath:
                                  'https://lottie.host/71ca47b4-3a8a-4ec2-88bc-a9a926d1c433/fR0ozvepu7.json',
                              desc: 'Strategize Moves, Conquer the Board!',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 170,
                          width: 170,
                          child: InkWell(
                            onTap: () {
                              inventory(widget.regno, "Carroms_booking");
                              context.read<Needed>().backend(
                                  widget.regno.toString(), "Carroms_booking");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Loading the data..."),
                                duration: Duration(seconds: 3),
                              ));
                              Future.delayed(
                                  Duration(seconds: 3),
                                  () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Superusersportpage(
                                                regno: widget.regno,
                                                imagepath:
                                                    'https://lottie.host/06e19206-a982-4280-99f1-fb5bef8c7ac8/u6knkLX9OT.json',
                                                sport: 'Carroms',
                                                available: available,
                                                booked: booked,
                                              ))));
                            },
                            child: Customlist(
                              sport: 'Carroms',
                              h: 170,
                              w: 180,
                              imagepath:
                                  'https://lottie.host/06e19206-a982-4280-99f1-fb5bef8c7ac8/u6knkLX9OT.json',
                              desc: 'Flick Coins, Pocket the Win...',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 170,
                          width: 170,
                          child: InkWell(
                            onTap: () {
                              inventory(widget.regno, "Tabletennis_booking");
                              context.read<Needed>().backend(
                                  widget.regno.toString(),
                                  "Tabletennis_booking");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Loading the data..."),
                                duration: Duration(seconds: 3),
                              ));
                              Future.delayed(
                                  Duration(seconds: 3),
                                  () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Superusersportpage(
                                                regno: widget.regno,
                                                imagepath:
                                                    'https://lottie.host/8c094098-ee4b-4a5e-8023-0cdb62f2e32a/CZrkDI2P2F.json',
                                                sport: 'Tabletennis',
                                                available: available,
                                                booked: booked,
                                              ))));
                            },
                            child: Customlist(
                              sport: 'Table Tennis',
                              h: 170,
                              w: 180,
                              imagepath:
                                  'https://lottie.host/8c094098-ee4b-4a5e-8023-0cdb62f2e32a/CZrkDI2P2F.json',
                              desc: 'Smash Returns, Rally for Victory...',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
