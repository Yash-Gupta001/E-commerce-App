import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomNavBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (index) {
        widget.onTap(index);
        switch (index) {
          case 0:
            Get.toNamed('/home');  // Use Get.toNamed() for navigation
            break;
          case 1:
            Get.toNamed('/search');
            break;
          case 2:
            Get.toNamed('/cart');
            break;
          case 3:
            Get.toNamed('/favorite');
            break;
          case 4:
            Get.toNamed('/profile');
            break;
        }
      },
      selectedItemColor: Colors.orangeAccent,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.black12,
      showUnselectedLabels: false, 
      elevation: 8, 
      items: const [
        BottomNavigationBarItem( 
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
    );
  }
}
