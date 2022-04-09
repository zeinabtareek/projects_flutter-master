import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects_flutter/component/image_dialoge.dart';

class ProfileController extends GetxController {
  final _picker = ImagePicker();
  final _imgPath = ''.obs;
  final Dio _dio = Dio();

  String get imgPath => _imgPath.value;

  removeImage() {
    _imgPath.value = '';
  }

  chooseProfileImage() async {
    try {
      final isGallery = await Get.dialog(const ChooseImageDialog());
      XFile? image;
      if (isGallery != null && isGallery == true) {
        image = await _picker.pickImage(source: ImageSource.gallery);
      } else if (isGallery != null && isGallery == false) {
        image = await _picker.pickImage(source: ImageSource.camera);
      }
      if (image != null) _imgPath.value = image.path;
    } catch (e) {
      print(e);
    }
  }

  final List<String> labels = [
    'My Orders',
    'Payment Methods',
    'Shipping Addresses',
    'My Wishlist',
    'Change Password',
    'Log Out'
  ];
  final List<String> subTitle = [
    'Already have 12 order',
    'visa **43',
    '3 addresses',
    '',
    '',
    ''
  ];
  final List<IconData> icons = [
    Icons.shopping_bag_outlined,
    Icons.payment,
    Icons.share_location_outlined,
    Icons.favorite_border_outlined,
    Icons.lock_outline,
    Icons.logout
  ];


}
