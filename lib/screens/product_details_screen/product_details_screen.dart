import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../component/add_button.dart';
 import '../../constants.dart';
import '../../models/cart_model.dart';
import '../../models/product_model.dart';
import '../cart_screen/cart_controller/cart_controller.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({this.productModel, });
  final ProductModel? productModel;
   @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: K.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Stack(
                children: [

                  Image(image: AssetImage('assets/images/32.png'),fit: BoxFit.cover,width: K.width,),
                ],
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 250.w,
                            height: 40.h,child: Text(
                            productModel!.title.toString().toUpperCase(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: K.blackColor,
                              fontFamily: "Poppins-Bold",
                            )
                           )
                          ),
                          SizedBox(
                            width: 6.w,
                          ),],),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share,
                              color: K.greyColor,
                            ),),],),
                  Text(
                    'Boomboogie',
                    style: TextStyle(
                      color: K.blackColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Description\n',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp
                    ),
                  ),
                  AutoSizeText(
                    productModel!.title.toString(),
                    // maxLines: 4,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Colors',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.grey,
                              fontFamily: "Poppins-Bold",
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productModel!.price.toString(),
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough,
                                fontFamily: "Poppins SemiBold",
                              ),
                            ),
                            Text(
                              '${(productModel!.price! -50)}\$',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
            ),
            GetBuilder<CartController>(
              init: CartController(),
              builder:(controller)=>  AddButton(
                text: 'Add to cart',
                onPressed: () {
                  controller.addToCart( CartProductModel(
                    name: productModel!.title.toString(),
                    price: productModel!.price,
                    productId:productModel!.id.toString(),
                    // rate: productDetailsModel.rate,
                    quantity: 1,
                  )
                  );
                },
              ),
            ), K.sizedBoxH,
            K.sizedBoxH,
          ],
        ),
      ),
    );
  }
}
