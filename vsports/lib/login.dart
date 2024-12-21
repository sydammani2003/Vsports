// ignore_for_file: avoid_print, unused_import, use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vsports/forgotpassword.dart';
import 'package:vsports/homepage.dart';
import 'package:vsports/link.dart';
import 'package:vsports/main.dart';
import 'package:vsports/otpreg.dart';
import 'package:vsports/register.dart';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:vsports/superuserhome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController regnumber = TextEditingController();
  TextEditingController password = TextEditingController();
  bool ispressed = false;

  loginapicall(fregnum, fpass) async {
    try {
      // Create an HttpClient that ignores SSL certificate errors
      var httpClient = HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      var ioClient = IOClient(httpClient);

      var response = await ioClient.post(
        Uri.parse('https://${ngrok_link}/api/login/'),
        body: {"reg_no": fregnum.toString(), "password": fpass.toString()},
      );

      var data = jsonDecode(response.body);
      print(data);
      if (data['message'] == 'Login successful') {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Homepage(
            regno: data['reg_no'],
            name: data['name'],
            email: data['email'],
          );
        }));
      } else if (data['message'] == 'Superuser logged in successfully!') {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Superuserhomepage(
            regno: data['reg_no'],
          );
        }));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['error'])),
        );
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: regnumber,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                hintText: 'Enter your reg number',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.person, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                hintText: 'Enter your password',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Forgotpassword();
                }));
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blue),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ispressed = !ispressed;
                  loginapicall(regnumber.text, password.text);
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
                  : const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisterScreen();
                }));
              },
              child: const Text(
                "Don't have an account? Register now",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
