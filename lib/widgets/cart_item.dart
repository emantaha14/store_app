import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/business_logic_layer/products_cubit/products_cubit.dart';

import '../data_layer/local_data/products_db.dart';

class CartItem extends StatefulWidget {
  final Map<dynamic, dynamic> productData;
  final Function(double)? onQuantityPlus;
  final Function(double)? onQuantityMinus;

  CartItem({
    super.key,
    required this.productData,
    this.onQuantityPlus,
    this.onQuantityMinus,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  ProductsDb sqlDb = ProductsDb();
  int counter = 0;

  double get totalProductPrice =>
      counter * double.parse(widget.productData['price']);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
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
                        Row(
                          children: [
                            Text(
                              widget.productData['category']
                                  .toString()
                                  .substring(9),
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 14),
                            ),

                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 5.2,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.purple, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding:
                                  const EdgeInsets.only(left: 4.5, right: 4.5),
                              margin: const EdgeInsets.only(right: 18),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        counter--;
                                        if (counter < 0) counter = 0;
                                        widget.onQuantityMinus!(double.parse(
                                            widget.productData['price']));
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.purple,
                                      size: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '$counter',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        counter++;
                                        widget.onQuantityPlus!(double.parse(
                                            widget.productData['price']));
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.purple,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$${totalProductPrice.toStringAsFixed(2)}',
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
