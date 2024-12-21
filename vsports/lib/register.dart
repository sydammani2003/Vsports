// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:vsports/link.dart';
import 'package:vsports/login.dart';
import 'package:vsports/otpreg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController regnumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  dynamic dvalue;

  regapicall(fname, mnum, regnum, gen, femail, fpassword) async {
    try {
      // Create an HttpClient that ignores SSL certificate errors
      var httpClient = HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      var ioClient = IOClient(httpClient);

      var response = await ioClient.post(
        Uri.parse('https://${ngrok_link}/api/register/'),
        body: {
          "name": fname.toString(),
          "reg_no": regnum.toString(),
          "phone_number": mnum.toString(),
          "mail": femail.toString(),
          "password": fpassword.toString(),
          "gender": gen.toString(),
        },
      );

      var data = jsonDecode(response.body);

      // Step 1: Extract cookies from the registration response
      String? rawCookie = response.headers['set-cookie'];
      String? cookies;
      if (rawCookie != null) {
        // Extract the cookie part before ';' to get the actual cookies
        cookies = rawCookie.split(';')[0];
      }

      if (data['message'] == 'OTP sent to email. Please verify.') {
        // Step 2: Navigate to the OTP verification page, passing the cookies
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Otpreg(cookies: cookies);
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

  bool ispressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintText: 'Full Name',
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
                controller: mobilenumber,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintText: 'Mobile Number',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: regnumber,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintText: 'University Registration Number',
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
              DropdownButtonFormField(
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
                  'Select Gender',
                  style: TextStyle(color: Colors.grey),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'M',
                    child: Text('Male', style: TextStyle(color: Colors.white)),
                  ),
                  DropdownMenuItem(
                    value: 'F',
                    child:
                        Text('Female', style: TextStyle(color: Colors.white)),
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    dvalue = value;
                  });
                },
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.email, color: Colors.grey),
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
                  hintText: 'Password',
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
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ispressed = !ispressed;
                    regapicall(name.text, mobilenumber.text, regnumber.text,
                        dvalue, email.text, password.text);
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
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    // ignore: prefer_const_constructors
                    return LoginScreen();
                  }));
                },
                child: const Text(
                  "Already have an account? Login now",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
