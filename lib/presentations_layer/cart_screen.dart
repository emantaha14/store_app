import 'package:flutter/material.dart';
import '../data_layer/local_data/products_db.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late double totalPrice = 0;

  ProductsDb sqlDb = ProductsDb();

  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData('SELECT * FROM StoreApp');
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
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.6,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CartItem(
                      productData: snapshot.data![index],
                      onQuantityPlus: (price) {
                        setState(() {
                          totalPrice += price;
                        });
                      },
                      onQuantityMinus: (price) {
                        setState(() {
                          totalPrice -= price;
                          if (totalPrice < 0) {
                            totalPrice = 0;
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Text(
                      'Total',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.purple[400],
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      maximumSize: MaterialStateProperty.all(Size.infinite),
                    ),
                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
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
