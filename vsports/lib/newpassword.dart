import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:vsports/link.dart';
import 'package:vsports/login.dart';

class Newpassword extends StatefulWidget {
  final String? mail;
  const Newpassword({super.key, this.mail});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  bool ispressed = false;
  TextEditingController npass = TextEditingController();
  TextEditingController cpass = TextEditingController();

  newpass(nepass, copass) async {
    try {
      // Create an HttpClient that ignores SSL certificate errors
      var httpClient = HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      var ioClient = IOClient(httpClient);

      var response = await ioClient.post(
        Uri.parse(
            'https://${ngrok_link}/api/update_password/'),
        body: {
          "new_password": nepass.toString(),
          "confirm_password": copass.toString(),
          "mail": widget.mail
        },
      );

      var data = jsonDecode(response.body);
      if (data['message'] == 'Password updated successfully') {
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
        padding: EdgeInsets.all(16),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Lottie.network(
                  'https://lottie.host/8596dc3b-3539-40c6-881f-df6b23888781/Sqp1xyOd2e.json'),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: npass,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                hintText: 'New Password',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.password, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: cpass,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                hintText: 'Confirm Password',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon:
                    const Icon(Icons.password_rounded, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ispressed = !ispressed;
                  newpass(npass.text, cpass.text);

                  Future.delayed(const Duration(seconds: 4), () {
                    setState(() {
                      ispressed = !ispressed;
                    });
                  });
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: ispressed
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 4,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Loading...',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
            ),
          ],
        )),
      ),
    );
  }
}
