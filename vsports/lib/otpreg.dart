// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, avoid_print, use_super_parameters

import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vsports/link.dart';
import 'package:vsports/login.dart';

class Otpreg extends StatefulWidget {
  final String? cookies; // Receive cookies from the registration page

  const Otpreg({Key? key, this.cookies}) : super(key: key);

  @override
  State<Otpreg> createState() => _OtpregState();
}

class _OtpregState extends State<Otpreg> {
  TextEditingController otp = TextEditingController();

  otpregapi(fotp) async {
    try {
      // Create an HttpClient that ignores SSL certificate errors
      var httpClient = HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      var ioClient = IOClient(httpClient);
      print('Sending OTP: $fotp');

      var response = await ioClient.post(
        Uri.parse('https://${ngrok_link}/api/verify_otp/'),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          if (widget.cookies != null)
            "Cookie": widget.cookies!, // Include cookies in the request
        },
        body: {"otp": fotp.toString()},
      );

      var data = jsonDecode(response.body);
      if (data['message'] == 'Registration successful!') {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      } else {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: Lottie.network(
                  "https://lottie.host/a535747f-1932-4f17-be77-5e8ff60cdf6c/AMNeJxRfkH.json"),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TextField(
                controller: otp,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintText: 'Enter OTP',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.key, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  otpregapi(otp.text);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Verify OTP',
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
