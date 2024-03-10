import 'package:flutter/material.dart';
import '../data_layer/local_data/favourite_products_db.dart';
import '../widgets/favourite_item.dart';

class FavouriteProductsScreen extends StatefulWidget {
  const FavouriteProductsScreen({super.key});

  @override
  State<FavouriteProductsScreen> createState() =>
      _FavouriteProductsScreenState();
}

class _FavouriteProductsScreenState extends State<FavouriteProductsScreen> {
  FavouriteProductsDb favouriteProductsDb = FavouriteProductsDb();
  int currentIndex = 0;

  Future<List<Map>> readData() async {
    List<Map> response =
        await favouriteProductsDb.readData('SELECT * FROM FavouriteProducts');
    print(response);
    return response;
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('there is data');
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FavouriteItem(
                  productData: snapshot.data![index],
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          print('has error');
          throw Exception('Error is :${snapshot.error}');
        } else {
          print('either nor');
          return const Center(
            child:
                CircularProgressIndicator(), // or any other loading indicator
          );
        }
      },
    );
  }
}
