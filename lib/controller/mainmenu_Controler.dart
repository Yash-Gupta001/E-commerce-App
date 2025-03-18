import 'package:app4/pages/favorite_products.dart';
import 'package:get/get.dart';
import 'package:app4/model/product_model.dart';
import 'package:app4/controller/favoriteController.dart';
import 'package:app4/controller/cartController.dart';

class HomeController extends GetxController {
  // Rx variables to track bottom navigation and favorite products
  RxInt currentIndex = 0.obs;
  final CartController cartController = Get.find();
  final FavoriteCont favoriteController = Get.find();

  // List of products
  List<Product> get products => [
        Product(
    id: '1',
    name: 'Product 1',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSah_Ue7KBL8YXyA2K92hXZTfhhH9RR_j2Hhw&s', // Example valid URL
    price: 100.0,
  ),
  Product(
    id: '2',
    name: 'Product 2',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSah_Ue7KBL8YXyA2K92hXZTfhhH9RR_j2Hhw&s', // Example valid URL
    price: 150.0,
  ),
  Product(
    id: '3',
    name: 'Product 3',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSah_Ue7KBL8YXyA2K92hXZTfhhH9RR_j2Hhw&s', // Example valid URL
    price: 200.0,
  ),
        // Add more products with unique IDs
      ];

  // Handle bottom navigation tap event
  void onItemTapped(int index) {
    currentIndex.value = index;

    // Navigate to the Favorite page when the "Favorites" icon is tapped
    if (index == 1) {
      Get.to(() => const FavoriteProducts()); // Navigate to the FavoriteProducts page
    }
  }

  // Add or remove a product from the favorites list
  void toggleFavorite(Product product) {
    if (favoriteController.favproducts.any((prod) => prod.id == product.id)) {
      favoriteController.favproducts.removeWhere((prod) => prod.id == product.id);
    } else {
      favoriteController.favproducts.add(product);
    }
  }
}
