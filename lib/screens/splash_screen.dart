import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'login_screen/login_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.secondaryColor,
      body:AnimatedSplashScreen(
        splash:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 100.w,
                height: 100.h,
                child: const Icon(Icons.shopping_cart_outlined, size: 40),
                decoration: const BoxDecoration(
                    color: K.whiteColor, shape: BoxShape.circle),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "ShopApp",
              style: TextStyle(
                  color: K.blackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),

          ],

        ), nextScreen:  const LoginScreen(),
        backgroundColor: K.mainColor,
        splashIconSize: 250,
        duration: 4000,
        splashTransition: SplashTransition.scaleTransition,
        animationDuration: const Duration(seconds: 1),

      ),
    );
  }
}
