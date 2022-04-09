import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projects_flutter/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? label;
  bool isHome =false;

    CustomAppBar({Key? key, this.actions, required this.isHome,this.label = ''})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        label!,
        style: TextStyle(
            fontSize: 20.sp, fontWeight: FontWeight.w500, color: K.blackColor),
      ),
      centerTitle: true,
      backgroundColor: K.whiteColor,
      elevation: 0,
      leading:IconButton(
        onPressed: () {
          Get.back();
        },
        icon:   Icon(
          Icons.arrow_back_ios_new_outlined,
          color:isHome==true? K.blackColor:K.whiteColor,
        ),
      ),
      actions: actions,
    );
  }
}
