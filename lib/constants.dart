import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class K {
  static const mainColor = Color(0xff5B4FDE);
  static const secondaryColor = Color(0xff76E69B);
  static const whiteColor = Color(0xffFAFAFA);
  static const blackColor = Color(0xff333333);
  static const greyColor = Color(0xff8E8E93);
  static const KPostTextColor= Color(0xff7A8FA6);
  static const peColor = Color(0xff5E53E0);
  static final width = Get.width;
  static final height = Get.height;
  static const String baseUrl = "https://elgomhouria.vps.webdock.io";
  static const textStyleAlert = TextStyle(
      fontSize: 20.0,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.dashed,
      decorationColor: Color(0x00ffffff));
  static SizedBox sizedBoxH = SizedBox(
    height: 15.h,
  );
  static SizedBox sizedBoxW = SizedBox(
    width: 22.w,
  );
}
