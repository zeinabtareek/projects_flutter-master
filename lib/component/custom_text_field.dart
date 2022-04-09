import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_flutter/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      this.icon,
      this.label,
      this.onchange,
      this.type,
      this.obSecure = false})
      : super(key: key);
  final String? label;
  final IconData? icon;
  final TextEditingController? controller;
  final Function(String)? onchange;
  final bool? obSecure;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      child: TextField(
        keyboardType: type,
        controller: controller,
        onChanged: onchange,
        obscureText: obSecure!,
        cursorColor: K.blackColor,
        style: TextStyle(
            color: K.blackColor, fontSize: 14.sp, fontFamily: "Raleway", fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: K.greyColor),
          labelText: label,
          labelStyle: TextStyle(
              fontFamily: "Raleway",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff8E8E93)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffDADADA)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffDADADA)),
          ),
        ),
      ),
    );
  }
}
