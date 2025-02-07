import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt cart = 0.obs;
  RxInt total = 0.obs;
  RxInt prodVal = 0.obs;

  void cartIncrease(int productPrice) {
    cart++;
    total.value += productPrice; 
    print('Cart Value: ${cart.value}');
    print('Total Value: ${total.value}');
  }

  void cartDecrease(int productPrice) {
    if (cart.value > 0) {
      cart--;
      total.value -= productPrice; 
      print('Cart Value: ${cart.value}');
      print('Total Value: ${total.value}');
    }
  }

  void setProductValue(int value) {
    prodVal.value = value;
    print('Product Value set to: ${prodVal.value}');
  }

  void prodAdd(int price) {
    total.value += price;
    print('Total Value after adding product: ${total.value}');
  }

  void prodRemove(int price) {
    total.value -= price;
    print('Total Value after removing product: ${total.value}');
  }
}