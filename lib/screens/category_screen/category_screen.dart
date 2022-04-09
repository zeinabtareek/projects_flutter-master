import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projects_flutter/component/appbar.dart';
import 'package:projects_flutter/constants.dart';
import 'package:projects_flutter/screens/category_screen/controller/category_controller.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class CategoryScreen extends StatelessWidget {
   String   Imagee='assets/images/32.png';

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(CategoryController());
    return Scaffold(
      appBar:  CustomAppBar(
        label: "Category Screen",
        isHome: false,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const AutoSizeText("Please Click On the Taps", style: K.textStyleAlert),
            ),
            SizedBox(
                height: 200.h,
                child: Center(
                  child: Obx(() => _controller.categoryModel.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: _controller.categoryModel.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                              _controller.check.value=true;
                                            _controller.getDetails(_controller.categoryModel[index].id!);
                                            // _controller.selectIndex.value==_controller.categoryModel[index].id!;
                                              _controller.selected(index);

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
                                              ),child: Center(
                                            child:AutoSizeText(
                                              _controller
                                                  .categoryModel[index].title!,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: K.whiteColor
                                              ),
                                              )
                                             )
                                           )
                                        )
                                      ],
                                    ),
                                  )),
                        )
                      : const CircularProgressIndicator()),
                )),
            Obx(()=>_controller.check.value? Container(
              padding: EdgeInsets.symmetric
                (horizontal: 2.0.w ,vertical: 2.0.h),

              child: GestureDetector(
              onTap: () {},
              child: InkWell(
                  onTap: (){
                    // Get.to(ProductDetails(
                    //   productModel: _controller.productModel,
                    // )
                    // );
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
                              Text('${_controller.categoryModel[_controller.selectIndex.value].title!}'
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
