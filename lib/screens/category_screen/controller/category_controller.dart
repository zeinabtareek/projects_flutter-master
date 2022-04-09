import 'package:get/get.dart';
import 'package:projects_flutter/controller/login_controller.dart';
import 'package:projects_flutter/models/categoryDetails.dart';
import 'package:projects_flutter/models/categoryModel.dart';
import 'package:projects_flutter/services/category_services.dart';

class CategoryController extends GetxController {
  final _services = CategoryServices();
  final selectIndex=0.obs;
  final check=false.obs;

  final categoryModel = <CategoryModel>[].obs;
CategoryModel ?categoryModelDetails;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    categoryModel.value=(await _services.getCategory())!;
  }

  getDetails(int id)async {
    categoryModelDetails =await _services.showCategoryDetails(id);
  }


  selected(int index) {
    selectIndex.value = index;
  }
}
