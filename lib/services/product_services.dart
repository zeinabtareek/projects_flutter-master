import 'package:dio/dio.dart';
import 'package:projects_flutter/constants.dart';
import 'package:projects_flutter/controller/auth_controller.dart';
import 'package:projects_flutter/models/product_model.dart';

class ProductServices {
  final Dio _dio = Dio();
  ProductModel? productModel;

  Future<List<ProductModel>?> getProduct() async {
    try {
      Response response = await _dio.get("${K.baseUrl}/api/products/",
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${AuthController.to.currentUser.token}',
          }));
      if (response.statusCode == 200) {
        final mList = List<ProductModel>.from(
            response.data.map((i) => ProductModel.fromJson(i)));
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

   showProduct(int id) async {
    try {
      Response response = await _dio.get("${K.baseUrl}/api/products/$id/",
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${AuthController.to.currentUser.token}',
          }));
      if (response.statusCode == 200) {

        print(response.data);
        productModel = ProductModel.fromJson(response.data);
        return productModel;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
