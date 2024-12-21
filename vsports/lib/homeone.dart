import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vsports/Booking_Pages/badmintonbooking.dart';
import 'package:vsports/Booking_Pages/basketballbooking.dart';
import 'package:vsports/Booking_Pages/carromsbooking.dart';
import 'package:vsports/Booking_Pages/chessbooking.dart';
import 'package:vsports/Booking_Pages/cricketbooking.dart';
import 'package:vsports/Booking_Pages/footballbooking.dart';
import 'package:vsports/Booking_Pages/ttbooking.dart';
import 'package:vsports/Booking_Pages/volleyball.dart';
import 'package:vsports/list.dart';
import 'package:vsports/ongoingsport.dart';

class Homeonepage extends StatefulWidget {
  var regno;
  Homeonepage({super.key, this.regno});

  @override
  State<Homeonepage> createState() => _HomeonepageState();
}

class _HomeonepageState extends State<Homeonepage> {
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
              Lottie.network(
                  'https://lottie.host/21c8764a-e7ad-418e-97db-dbcfc559d38d/g5sDMGkjx3.json'),
              const SizedBox(
                height: 50,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cricket(
                                            regno: widget.regno,
                                          )));
                            },
                            child: Customlist(
                              sport: 'cricket',
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Badminton())),
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Volleyball(regno: widget.regno,))),
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Basketball(regno: widget.regno,))),
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Football(regno: widget.regno,))),
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Chess(regno: widget.regno,))),
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Carrom(regno: widget.regno,))),
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Tabletennis(regno: widget.regno,))),
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
