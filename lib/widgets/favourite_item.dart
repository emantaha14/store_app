import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/business_logic_layer/products_cubit/products_cubit.dart';
import 'package:store_app/data_layer/local_data/favourite_products_db.dart';
import '../data_layer/local_data/products_db.dart';

class FavouriteItem extends StatefulWidget {
  final Map<dynamic, dynamic> productData;

  const FavouriteItem({
    super.key,
    required this.productData,
  });

  @override
  _FavouriteItemState createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  ProductsDb sqlDb = ProductsDb();
  FavouriteProductsDb favouriteProductsDb = FavouriteProductsDb();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 133,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.purple[100],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.productData['image'] as String,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productData['title'] as String,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.productData['category']
                              .toString()
                              .substring(9),
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 14),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.purple,
                              ),
                              height: 35,
                              width: 70,
                              child: MaterialButton(
                                onPressed: () async {
                                  print('response =========================');
                                  int response = await sqlDb.insertData(
                                      'INSERT INTO StoreApp(title, category, price, image, fakeId) VALUES("${widget.productData['title']}", "${widget.productData['category']}", "${widget.productData['price']}", "${widget.productData['image']}", "${widget.productData['id']}")');
                                  print(response);
                                },
                                child: const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$${double.parse(widget.productData['price']).toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
