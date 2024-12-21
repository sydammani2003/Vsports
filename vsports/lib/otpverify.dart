import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Otpverify extends StatelessWidget {
  const Otpverify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222831),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Verify OTP",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp,
                        color: const Color(0xEEEEEEEE))),
              ),
            ],
          ),
          SizedBox(
            height: 100.h,
          ),
          Lottie.network(
              'https://lottie.host/4cf5d792-387d-4765-a826-3169abb493b2/6NKcBRCM7Y.json',
              width: 200.w,
              height: 200.h),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 75.h,
            width: 392.w,
            child: TextField(
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Color(0xFFFFFFFF))),
              obscureText: true,
              decoration: InputDecoration(
                  label: const Text("OTP"),
                  filled: true,
                  fillColor: const Color(0xFF393E46),
                  hintText: "Enter OTP",
                  hintStyle: GoogleFonts.notoSansOldItalic(
                      textStyle: TextStyle(
                          fontSize: 20.sp, color: const Color(0xEEEEEEEE))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r))),
            ),
          )
        ],
      )),
    );
  }
}
