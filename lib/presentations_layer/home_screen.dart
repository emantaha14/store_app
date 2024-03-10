import 'package:flutter/material.dart';
import 'package:store_app/presentations_layer/cart_screen.dart';
import 'package:store_app/presentations_layer/favourite_products_screen.dart';
import 'package:store_app/presentations_layer/profile_screen.dart';
import '../data_layer/local_data/products_db.dart';
import 'all_products_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.username});
  final String username;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsDb sqlDb = ProductsDb();
  int currentIndex = 0;
  List titles = ['Store App', 'Favourites', 'Cart', 'Profile'];
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [const AllProductsScreen(), const FavouriteProductsScreen(), CartScreen(), ProfileScreen(username: widget.username)];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              label: 'favourites', icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: 'Cart', icon: Icon(Icons.shopping_cart_checkout)),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            sqlDb.onDeleteDataBase();
          },
          icon: Image.asset(
           'assets/images/user.png'
          ),
          color: Colors.black,
        ),
        backgroundColor: Colors.purple[50],
        elevation: 0,
        title:  Text(
          titles[currentIndex],
          style: const TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: pages.elementAt(currentIndex)
    );
  }


}
