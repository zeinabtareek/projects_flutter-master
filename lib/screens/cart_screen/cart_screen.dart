import 'package:auto_size_text/auto_size_text.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:get/get.dart';
import '../../component/add_button.dart';
import '../../component/appbar.dart';
import '../../component/cart_container.dart';
import '../../component/payment_group.dart';
import '../../constants.dart';
import 'cart_controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:   CustomAppBar(
        label: "Cart Screen",
        isHome: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0.w ,vertical: 8.0.h),
          child: GetBuilder<CartController>(
            init:CartController() ,
            builder:(controller)=> controller.cartProductModel.length == 0
                ? Center(
              child: Text("Empty"),
            ): Wrap(
            children: [
               ListView.builder(
                  itemCount: controller.cartProductModel.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Cart(
                                price: '',
                                image:'assets/images/32.png',
                                label: controller.cartProductModel[index].name.toString(),
                                quantity: controller.cartProductModel[index].quantity,
                                decrease: () {
                                  controller.decreaseQuentity(index);
                                },
                                increase: () {
                                  controller.increaseQuentity(index);
                                },
                                clear: () {
                                  controller.deleteProduct(controller.cartProductModel[index].name.toString());
                                },
                              );
                  }),
              K.sizedBoxH,
              GestureDetector(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric
                      (horizontal: 8.0.w ,vertical: 8.0.h),
                    child: AutoSizeText(' Clear all ' ,style: TextStyle(color :K.mainColor ,),),
                  ),
                ),
                onTap: (){
                  controller.deleteAllProduct();
                },
              ),
             SizedBox(height: 30.h,),
              PaymentGroupe(
                subTotal:  controller.totalPrice,
                shipping: 30,
                Total:  controller.totalPriceWithShipping,
                ),
              Center(
                child: AddButton(
                  text: 'Checkout',
                  onPressed: () {
                  },
                ),
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
