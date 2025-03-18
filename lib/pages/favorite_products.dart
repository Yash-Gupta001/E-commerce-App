import 'package:app4/ui/ui_component/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/favoriteController.dart';
import '../ui/ui_component/custom_navigation_bar.dart';

class FavoriteProducts extends StatelessWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteCont controller = Get.find<FavoriteCont>();

    return Scaffold(
      appBar: CustomAppbar(title: 'Favorite'),
      body: Obx(() {
        return controller.favproducts.isEmpty
            ? Center(child: Text("No favorites added yet"))
            : ListView.builder(
                itemCount: controller.favproducts.length,
                itemBuilder: (context, index) {
                  final product = controller.favproducts[index];
                  return ListTile(
                    leading: Image.network(product.imageUrl, width: 50, height: 50),
                    title: Text(product.name),
                    subtitle: Text('\$${product.price}'),
                  );
                },
              );
      }),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 3, 
        onTap: (index) {},
      ),
    );
  }
}
