import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import 'package:app4/controller/cartController.dart';
import 'package:app4/controller/favoriteController.dart';
import 'package:app4/ui/ui_component/CustomAppbar.dart';
import 'package:app4/ui/ui_component/custom_navigation_bar.dart';
import 'package:app4/model/product_model.dart';
import 'favorite_products.dart'; // Import the FavoriteProducts page

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _currentIndex = 0;
  final CartController cartController = Get.put(CartController());
  final FavoriteCont favoriteController = Get.put(FavoriteCont());

  // Handle bottom navigation tap event
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate to the Favorite page when the "Favorites" icon is tapped
    if (index == 1) {
      Get.to(() => const FavoriteProducts()); // Navigate to the FavoriteProducts page
    }
  }

  // List of products
  List<Product> get _products => [
    Product(
      id: '1',  // Unique ID for this product
      name: 'Product 1',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSah_Ue7KBL8YXyA2K92hXZTfhhH9RR_j2Hhw&s',
      price: 100.0,
    ),
    Product(
      id: '2',
      name: 'Product 2',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSah_Ue7KBL8YXyA2K92hXZTfhhH9RR_j2Hhw&s',
      price: 150.0,
    ),
    Product(
      id: '3',
      name: 'Product 3',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSah_Ue7KBL8YXyA2K92hXZTfhhH9RR_j2Hhw&s',
      price: 200.0,
    ),
    // Add more products with unique IDs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Home'),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // GridView for Products
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      final product = _products[index];

                      return GestureDetector(
                        onTap: () {
                          // Add product to cart
                          cartController.cartIncrease(product.price.toInt());
                          cartController.setProductValue(product.price.toInt());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: product.imageUrl,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) {
                                    print('Error loading image: $error');
                                    return const Icon(Icons.error);
                                  },
                                ),
                                // Add Text Overlay
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    color: Colors.black54,
                                    child: Text(
                                      '${product.name}\n\$${product.price}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                // Favorite Icon
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Obx(() => IconButton(
                                    icon: Icon(
                                      favoriteController.favproducts.any((prod) => prod.id == product.id)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      // Toggle product in favorites
                                      if (favoriteController.favproducts.any((prod) => prod.id == product.id)) {
                                        favoriteController.favproducts.removeWhere((prod) => prod.id == product.id);
                                      } else {
                                        favoriteController.favproducts.add(product);
                                      }
                                    },
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}