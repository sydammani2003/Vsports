import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:vsports/Confirm_Boooking_Pages.dart/footballconfirm.dart';

class Football extends StatefulWidget {
  var regno;
  Football({super.key, this.regno});

  @override
  State<Football> createState() => _FootballState();
}

class _FootballState extends State<Football> {
  var d;
  var tt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Slot Booking",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: 80,
                    width: 80,
                    child: Lottie.network(
                        'https://lottie.host/56148833-6f76-4c6b-acba-54f83e52a27c/WQSJNAJWbM.json'))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Select Equipment",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please select the required equipment for your chosen sport. Ensure you have the necessary items to enjoy your game. If you need assistance, contact the sports office.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Player Details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(12),
              height: 50,
              width: 300,
              child: Text(
                "Player 1 - You",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Number of Balls Required",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                dropdownColor: Colors.grey[900],
                hint: const Text(
                  'Select no. of Balls',
                  style: TextStyle(color: Colors.grey),
                ),
                items: const [
                  DropdownMenuItem(
                    value: '1',
                    child: Text('1', style: TextStyle(color: Colors.white)),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('2', style: TextStyle(color: Colors.white)),
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    d = value;
                  });
                },
                style: const TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Time Slot",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                dropdownColor: Colors.grey[900],
                hint: const Text(
                  'Select Time Slot',
                  style: TextStyle(color: Colors.grey),
                ),
                items: const [
                  DropdownMenuItem(
                    value: '16:00 - 16:40',
                    child: Text('16:00 - 16:40',
                        style: TextStyle(color: Colors.white)),
                  ),
                  DropdownMenuItem(
                    value: '16:50 - 17:30',
                    child: Text('16:50 - 17:30',
                        style: TextStyle(color: Colors.white)),
                  ),
                  DropdownMenuItem(
                    value: '17:40 - 18:20',
                    child: Text('17:40 - 18:20',
                        style: TextStyle(color: Colors.white)),
                  ),
                  DropdownMenuItem(
                    value: '18:30 - 19:10',
                    child: Text('18:30 - 19:10',
                        style: TextStyle(color: Colors.white)),
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    tt = value;
                  });
                },
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Footballconfirmbooking(regno: widget.regno,balls: d,tt: tt,)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
                child: const Text(
                  'Proceed With Slot',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
