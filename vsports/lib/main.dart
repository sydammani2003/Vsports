// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsports/Booking_Pages/badmintonbooking.dart';
import 'package:vsports/Booking_Pages/basketballbooking.dart';
import 'package:vsports/Booking_Pages/carromsbooking.dart';
import 'package:vsports/Booking_Pages/chessbooking.dart';
import 'package:vsports/Booking_Pages/cricketbooking.dart';
import 'package:vsports/Booking_Pages/footballbooking.dart';
import 'package:vsports/Booking_Pages/ttbooking.dart';
import 'package:vsports/Booking_Pages/volleyball.dart';
import 'package:vsports/Confirm_Boooking_Pages.dart/badmintonconfirm.dart';
import 'package:vsports/Confirm_Boooking_Pages.dart/basketballconfirm.dart';
import 'package:vsports/Confirm_Boooking_Pages.dart/carromconfirm.dart';
import 'package:vsports/Confirm_Boooking_Pages.dart/chessconfirm.dart';
import 'package:vsports/Confirm_Boooking_Pages.dart/cricketconfirm.dart';
import 'package:vsports/Confirm_Boooking_Pages.dart/footballconfirm.dart';
import 'package:vsports/Confirm_Boooking_Pages.dart/tabletennisconfirm.dart';
import 'package:vsports/Confirm_Boooking_Pages.dart/volleyballconfirm.dart';
import 'package:vsports/confirmationpage.dart';
import 'package:vsports/errorpage.dart';
import 'package:vsports/forgotpassword.dart';
import 'package:vsports/forotpreg.dart';
import 'package:vsports/homepage.dart';
import 'package:vsports/list.dart';
import 'package:vsports/login.dart';
import 'package:vsports/newpassword.dart';
import 'package:vsports/nothingongoing.dart';
import 'package:vsports/ongoing/tabletennisongoing.dart';
import 'package:vsports/otpreg.dart';
import 'package:vsports/profile.dart';
import 'package:vsports/register.dart';
import 'package:vsports/superuserhome.dart';
import 'package:vsports/superuserlist.dart';
import 'package:vsports/superusersport.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Needed())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Superusersportpage(),
      ),
    );
  }
}
