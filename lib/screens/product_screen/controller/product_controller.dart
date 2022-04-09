import 'package:get/get.dart';
import 'package:projects_flutter/models/product_model.dart';
import 'package:projects_flutter/services/product_services.dart';

class ProductController extends GetxController {
  final _service = ProductServices();
  final selectIndex=0.obs;
final check=false.obs;
  final productList = <ProductModel>[].obs;
  ProductModel? productModel;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    productList.value=(await _service.getProduct())!;
  }


  getProductId(int id)async {
    productModel =await _service.showProduct(id);

  }
  selected(int index) {
    selectIndex.value = index;
  }
}
