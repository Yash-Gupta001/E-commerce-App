import 'package:get/get.dart';
import 'package:app4/model/product_model.dart';

class FavoriteCont extends GetxController {
  RxList<Product> favproducts = <Product>[].obs;

  // Add a product to the favorites list
  void addToFavorites(Product product) {
    favproducts.add(product);
  }

  // Remove a product from favorites
  void removeFromFavorites(Product product) {
    favproducts.remove(product);
  }
}
