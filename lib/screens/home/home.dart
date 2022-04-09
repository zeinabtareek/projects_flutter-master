import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projects_flutter/constants.dart';
import 'package:projects_flutter/screens/category_screen/category_screen.dart';
import 'package:projects_flutter/screens/home/controller/home_controller.dart';
import 'package:projects_flutter/screens/product_screen/product_screen.dart';
import 'package:projects_flutter/screens/profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final List<Widget> screens = [
      CategoryScreen(),
    const ProductScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(HomeController());
    return Scaffold(
        body: Obx(() => Center(child: screens[_controller.index])),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.cart),
                label: 'category',
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.basket),
                label: 'product',
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.account),
                label: 'profile',
              ),
            ],
            selectedItemColor: K.secondaryColor,
            onTap: (index) {
              _controller.onTab(index);
            },
            currentIndex: _controller.index,
          ),
        ));
  }
}
