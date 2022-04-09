import 'package:get/get.dart';

import '../../../models/cart_model.dart';
import '../../../sql_lite/db.dart';


class CartController extends GetxController {
  var dbHelper =CartDatabaseHelper.db;

  List<CartProductModel> _cartProductModel=[];
  List<CartProductModel> get cartProductModel=>_cartProductModel;
  final  _totalPrice = 0.0.obs;
  double get totalPrice =>_totalPrice.value;
  final  _shippingPrice = 0.0.obs;
  double get shippingPrice =>_shippingPrice.value;
  final  _totalPriceWithShipping = 0.0.obs;
  double get totalPriceWithShipping =>_totalPriceWithShipping.value;


  @override
  void onInit() async {
    super.onInit();
    getAllProductList();
    getTotalPrice();
  }

  addToCart(CartProductModel cartProductModel)async{
    for(int i=0;i<_cartProductModel.length ;i++){
      if(_cartProductModel[i].productId==cartProductModel.productId){
        return  Get.snackbar('Filed', 'you added the ${cartProductModel.name} before ',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2));
      }
    }
    var dbHelper =CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    print(_cartProductModel.length);
    _totalPrice.value =0.0;
    for(int i=0;i<_cartProductModel.length ;i++){
      _totalPrice.value+=(double.parse('${_cartProductModel[i].price}'));
    }    print(_totalPrice);
    Get.snackbar('Product Added', 'you have added the ${cartProductModel.name} to the cart ',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
    update();


  }
  getAllProductList()async{
    var dbHelper =CartDatabaseHelper.db;
    _cartProductModel=await dbHelper.getAllProduct();
    getTotalPrice();
    // getTotalPriceWithShipping();
    update();
    print(_cartProductModel.length);
  }

  increaseQuentity( int index )async{

    _cartProductModel[index].quantity++;
    _totalPrice.value +=double.parse( _cartProductModel[index].price.toString());
   await  dbHelper.updateProduct(_cartProductModel[index]);
   print('kioemimfnvnnvnnnvnnvnnvnvnvnnvnvnv$_totalPrice');

    update();

    _totalPriceWithShipping.value = _totalPrice.value+ _shippingPrice.value;

   }

  decreaseQuentity(int index)async{
     if(_cartProductModel[index].quantity !=0){
      _cartProductModel[index].quantity--;
      _totalPrice.value-=(double.parse('${_cartProductModel[index].price}')
      );

      await dbHelper.updateProduct(_cartProductModel[index]);
    }
    else if(_cartProductModel[index].quantity <=1){
      _totalPrice.value=0;
      _cartProductModel[index].quantity=0;
      deleteProduct(_cartProductModel[index].name.toString());
      _totalPriceWithShipping.value -= _totalPrice.value+ _shippingPrice.value;
    }update();
     _totalPriceWithShipping.value = _totalPrice.value+ _shippingPrice.value;

  }

  getTotalPrice() {
    _totalPrice.value = 0;
    _totalPriceWithShipping.value = 0;
    _shippingPrice.value = 30;
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice.value +=
          double.parse(_cartProductModel[i].price.toString()) *
              _cartProductModel[i].quantity;}
    _totalPriceWithShipping.value += _totalPrice.value + _shippingPrice.value;
    print(_totalPrice);
    update();
  }

  deleteProduct(String name) async {
    await dbHelper.deleteProduct(name);
    getAllProductList();
    getTotalPrice();
    _totalPrice.value=0.0;
    update();
  }
  deleteAllProduct() async {
    await dbHelper.deleteAllProduct();
    getAllProductList();
    getTotalPrice();
    update();
  }
}
