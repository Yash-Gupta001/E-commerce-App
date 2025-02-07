import 'package:app4/controller/cartController.dart';
import 'package:app4/pages/payment/payment.dart';
import 'package:app4/ui/custombutton.dart';
import 'package:app4/ui/ui_component/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _currentIndex = 2; 

  // CartController
  final CartController cartController = Get.find<CartController>();

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.orangeAccent,
        title: Center(
          child: Text(
            'Cart',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              letterSpacing: 2.0,
            ),
          ),
        ),
        elevation: 10, 
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // Display products in the cart
            Obx(() => cartController.cart.value > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: cartController.cart.value,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Product $index'),
                          subtitle: Text('Price: \₹${cartController.prodVal.value}'),
                        );
                      },
                    ),
                  )
                : Text('Your cart is empty')),

            SizedBox(height: 20),

            Obx(() => Text(
                  'Total Price: \₹${cartController.total.value}',
                  style: TextStyle(fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent
                  ),
                )),



           Obx(() {
  return cartController.cart.value > 0
      ? CustomButton(
          text: 'Pay',
          onPressed: () {
            Get.to(() => Payment()); 
          },
        )
      : SizedBox.shrink(); 
}),




          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
