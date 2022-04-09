import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants.dart';


class PaymentGroupe extends StatelessWidget {

  final double? Total;
  final double ?subTotal;
  final double ?shipping;


  const PaymentGroupe({
    Key? key,
    this.subTotal,
     this.shipping,
      this.Total,

    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            AutoSizeText(
              'Sub Total',
              style: TextStyle(
                fontWeight: FontWeight.w500, fontSize:16.sp,
              ),
            ),
            AutoSizeText(
              '\$ ${subTotal}',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize:16.sp,
                  color: K.mainColor),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            AutoSizeText(
              'Shipping',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize:16.sp, height: 2.h),
            ),
            AutoSizeText(
              '\$ $shipping',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize:16.sp,
                  color: K.mainColor,
                  height: 2.h),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            AutoSizeText('Total',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize:18.sp, height: 3.h),
            ),
            AutoSizeText(
              '\$ ${Total}',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize:18.sp,
                  color: K.mainColor,
                  height: 3.h),
            ),
          ],
        ),
      ],
    );
  }
}
