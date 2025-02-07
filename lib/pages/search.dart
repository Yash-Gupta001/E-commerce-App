import 'package:app4/controller/searchController.dart';
import 'package:app4/ui/ui_component/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    // search controller
    final SearchCont controller = Get.put(SearchCont());
    int _currentIndex = 1; // Start with the 'Search' tab selected

    // Handle bottom navigation tap event
    void _onItemTapped(int index) {

    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.orangeAccent,
        title: Center(
          child: Text(
            'Search product',
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
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  labelText: 'Type to search product',
                  border: OutlineInputBorder(),
                  prefixIcon: GestureDetector(
                    onTap: controller.pickImageFromCamera, // Trigger camera
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                  fillColor: Colors.orange[100],
                  filled: true,
                ),
              ),

              const SizedBox(height: 20),
              
              // Dummy list of search results

              // Expanded(
              //   child: ListView.builder(
              //     itemCount: 10, 
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         leading: Icon(Icons.search),
              //         title: Text('Search result #$index'),
              //         subtitle: Text('This is a sample result description.'),
              //         onTap: () {
              //           // Handle item tap if needed
              //         },
              //       );
              //     },
              //   ),
              // ),

            ],
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
