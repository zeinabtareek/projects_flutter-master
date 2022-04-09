import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projects_flutter/component/appbar.dart';
import 'package:projects_flutter/constants.dart';
import 'package:projects_flutter/models/product_model.dart';
import 'package:projects_flutter/screens/cart_screen/cart_screen.dart';
import 'package:projects_flutter/screens/product_screen/controller/product_controller.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../product_details_screen/product_details_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String   Imagee='assets/images/32.png';
    final _controller = Get.put(ProductController());
    return Scaffold(
      appBar:   CustomAppBar(
        label: "Product Screen",
        isHome: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: K.greyColor,
                size: 25.sp,
              ),
              onPressed: () {
                Get.to(CartScreen());
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const AutoSizeText("Product", style: K.textStyleAlert),
            ),
            SizedBox(
              height: 200.h,
              child: Center(
                  child: Obx(() => _controller.productList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: _controller.productList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                 _controller.getProductId(_controller.productList[index].id!);
                                 _controller.selected(index);
                                    _controller.check.value=true;
                                      },
                                      child: Container(
                                        width: 100.w,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                            gradient:   const LinearGradient(colors: [K.KPostTextColor, K.mainColor],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius: BorderRadius.circular(28.0)
                                        ),child:
                                      Center(
                                        child: Text(
                                          _controller.productList[index].title!,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: K.whiteColor
                                          ),
                                        ),
                                      )
                                      ),),
                                    // SizedBox(
                                    //   width: 55.w,
                                    //   child: AutoSizeText(
                                    //     _controller.productList[index].title!,
                                    //     maxLines: 2,
                                    //     textAlign: TextAlign.center,
                                    //   ),
                                    // )
                                  ],
                                ),
                              ))
                      : const Center(child: CircularProgressIndicator()))),
            ),

                      Obx(()=>_controller.check.value? Container(
                               padding: EdgeInsets.symmetric
                                 (horizontal: 2.0.w ,vertical: 2.0.h),                              child: GestureDetector(
                                 onTap: () {},
                                 child: InkWell(
                                     onTap: (){
                                       Get.to(ProductDetails(
                                    productModel: _controller.productModel,
                                       )
                                       );
                                     },
                                     child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                   Image(image: AssetImage(Imagee)),
                               Container(
                                 width: K.width,
                                 height: 80.h,
                                 child:Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Text('${_controller.productList[_controller.selectIndex.value].title!}'
                                           ,style: TextStyle(
                                               fontSize: 20.sp,
                                               color: Colors.white)),
                                       Text('${_controller.productList[_controller.selectIndex.value].price!}\$'
                                           ,style: TextStyle(
                                               fontSize: 20.sp,
                                               color: Colors.white)),]),

                                 decoration: BoxDecoration(
                                     color: K.blackColor,
                                     borderRadius: BorderRadius.circular(15)),)
                                  ],
                                )
                              ),
                              ),

                ):SizedBox())
          ],
        ),
      ),
    );
  }
}
