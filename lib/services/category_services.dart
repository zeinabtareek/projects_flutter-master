import 'package:dio/dio.dart';
import 'package:projects_flutter/constants.dart';
import 'package:projects_flutter/controller/auth_controller.dart';
import 'package:projects_flutter/models/categoryDetails.dart';
import 'package:projects_flutter/models/categoryModel.dart';
import 'package:projects_flutter/models/product_model.dart';

class CategoryServices {
  final Dio _dio = Dio();
  CategoryDetailsModel? categoryDetailsModel;

  Future<List<CategoryModel>?> getCategory() async {
    try {
      Response response = await _dio.get("${K.baseUrl}/api/categories",
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${AuthController.to.currentUser.token}',
          }));
      if (response.statusCode == 200) {
        final mList = List<CategoryModel>.from(
            response.data.map((i) => CategoryModel.fromJson(i)));
        print(mList.length);
        // print(response.data);
        // for (int i = 0; i < 13; i++) {
        //   productModel = ProductModel.fromJson(response.data[i]);
        //   print(productModel!.toJson());
        // }
        return mList;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

   showCategoryDetails(int id) async {
    try {
      Response response = await _dio.get("${K.baseUrl}/api/categories/$id/",
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${AuthController.to.currentUser.token}',
          }));
      if (response.statusCode == 200) {
        print(response.data);
        categoryDetailsModel = CategoryDetailsModel.fromJson(response.data);
        return categoryDetailsModel;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }



}
