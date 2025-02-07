import 'package:app4/controller/cartController.dart';
import 'package:app4/ui/ui_component/CustomAppbar.dart';
import 'package:app4/ui/ui_component/IconTitleCardItem.dart';
import 'package:app4/ui/ui_component/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _currentIndex = 0; 
  final CartController cartController = Get.put(CartController());

  // Handle bottom navigation tap event
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of items for the Horizontal Card Page
    
    List<CardItem> items = [

      IconTitleCard(
        text: "Kitchen",
        iconData: Icons.soup_kitchen, 
        onTap: () {  },
      ),

      IconTitleCard(
        text: "grocery",
        iconData: Icons.local_grocery_store_sharp, 
        onTap: () {  },
      ),

      IconTitleCard(
        text: "Electronics",
        iconData: Icons.mobile_friendly_sharp,
        onTap: () {  },
      ),

    ];


    final images = [
      'https://c8.alamy.com/comp/R06CKK/galati-romania-october-26-2018-apple-launch-the-new-smartphone-iphone-xs-and-iphone-xs-max-iphone-xs-max-on-white-background-R06CKK.jpg',

      'https://c8.alamy.com/comp/R06CKK/galati-romania-october-26-2018-apple-launch-the-new-smartphone-iphone-xs-and-iphone-xs-max-iphone-xs-max-on-white-background-R06CKK.jpg',

      'https://c8.alamy.com/comp/R06CKK/galati-romania-october-26-2018-apple-launch-the-new-smartphone-iphone-xs-and-iphone-xs-max-iphone-xs-max-on-white-background-R06CKK.jpg',

      'https://c8.alamy.com/comp/R06CKK/galati-romania-october-26-2018-apple-launch-the-new-smartphone-iphone-xs-and-iphone-xs-max-iphone-xs-max-on-white-background-R06CKK.jpg',

      'https://c8.alamy.com/comp/R06CKK/galati-romania-october-26-2018-apple-launch-the-new-smartphone-iphone-xs-and-iphone-xs-max-iphone-xs-max-on-white-background-R06CKK.jpg',

      'https://c8.alamy.com/comp/R06CKK/galati-romania-october-26-2018-apple-launch-the-new-smartphone-iphone-xs-and-iphone-xs-max-iphone-xs-max-on-white-background-R06CKK.jpg',

      'https://c8.alamy.com/comp/R06CKK/galati-romania-october-26-2018-apple-launch-the-new-smartphone-iphone-xs-and-iphone-xs-max-iphone-xs-max-on-white-background-R06CKK.jpg',


    
      'assets/products/electronics/mob1.jpg',
    ];

    final productPrice = 100;

    return Scaffold(
      
        appBar: CustomAppbar(
          title: 'HOME', leading: false,
        ),
      
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                 
                  HorizontalCardPager(
                    onPageChanged: (page) => print("page : $page"),
                    onSelectedItem: (page) => print("selected : $page"),
                    items: items, 
                  ),
                  
                
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Add product to cart and price
                            cartController.cartIncrease(productPrice);
                            cartController.setProductValue(productPrice); 
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              image: images[index].startsWith('http')
                                  ? DecorationImage(
                                      image: NetworkImage(images[index]),
                                      fit: BoxFit.contain,
                                    )
                                  : DecorationImage(
                                      image: AssetImage(images[index]),
                                      fit: BoxFit.contain,
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
