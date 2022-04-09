import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 import '../constants.dart';
class AddButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;

  const AddButton({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric
          (horizontal: 8.0.w ,vertical: 8.0.h),
        child: AutoSizeText(
          text!,
          style: TextStyle(
            color: K.whiteColor,
            fontSize: 18.sp,
            fontFamily: "Poppins SemiBold",
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(350.w, 30.h),
          primary: K.blackColor,
          // primary:Color(0xFFF5F5F5),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}