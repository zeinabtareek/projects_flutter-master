import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projects_flutter/component/appbar.dart';
import 'package:projects_flutter/component/avatar_image.dart';
import 'package:projects_flutter/component/fixed_list_tile.dart';
import 'package:projects_flutter/constants.dart';
import 'package:projects_flutter/controller/auth_controller.dart';
import 'package:projects_flutter/screens/profile_screen/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth=Get.put(AuthController());

    final _controller = Get.put(ProfileController());
    return Scaffold(
      appBar: CustomAppBar(
        isHome: true,
        label: "Profile",
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //      auth.logOut();
        //     },
        //     icon: Icon(Icons.logout, color:K.mainColor, size: 15.sp),
        //   )
        // ],
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Center(
                child: Obx(
                      () => LargeAvatarWithButton(
                      onPressed: () {
                        _controller.chooseProfileImage();
                        // _controller.selectImage();
                      },
                      image: _controller.imgPath.isNotEmpty
                          ? Image.file(
                        File(_controller.imgPath),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                          : Image.network(
                        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )

                  ),
                )),
            Text(
              auth.currentUser.name!,
              softWrap: true,
              style: TextStyle(
                  color: K.blackColor,
                  fontFamily: 'Poppins-Bold',
                  fontSize: 20.sp),
            ),
            Text(
              auth.currentUser.email!,
              softWrap: true,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            ),
            ListView.builder(
                itemCount: _controller.labels.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) => FixedListTile(
                  onTap: () {
                    if (index == 0) {
                      // Get.to(OrderHistory());
                    } else if (index == 1) {
                      // Get.to(PaymentScreen());
                    } else if (index == 2) {
                      // Get.to(AddressScreen(address: '',));
                    } else if (index == 3) {
                    } else if (index == 4) {
                      auth.logOut();
                    }
                    else if (index == 5) {
                      auth.logOut();

                    }
                  },
                  title: _controller.labels[index],
                  subTitle: _controller.subTitle[index],
                  iconLeading: _controller.icons[index],
                )),
          ],
        ),
      )
    );
  }
}
