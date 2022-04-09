import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_flutter/constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, this.label, this.onTap}) : super(key: key);
  final Function()? onTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 48.h,
      child: TextButton(
        onPressed: onTap,
        child: Text(label!,
            style: TextStyle(
                color: K.whiteColor,
                fontSize: 18.sp,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w500)),
        style: TextButton.styleFrom(
            backgroundColor: K.secondaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
