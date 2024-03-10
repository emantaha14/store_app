import 'package:flutter/material.dart';
import '../data_layer/global_data/models/products_model.dart';
import '../data_layer/local_data/products_db.dart';

class ProductDetails extends StatelessWidget {
  final List<ProductsModel> productsModel;
  final int index;
  ProductsDb sqlDb =  ProductsDb();
   ProductDetails(
      {super.key, required this.productsModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
            productsModel[index].title.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                  height: 300,
                  width: 250,
                  child: Image.network(productsModel[index].image)),
            ),
            const SizedBox(height: 30,),
            const Text('Information:',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
            ),),
            Divider(
              height: 10,
              thickness: 2,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Text(
                  productsModel[index].category.toString().substring(9),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[500]
                  ),
                )
              ],
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Price',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Text(
                    '${productsModel[index].price}\$',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[500]
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Rate',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Text(
                    productsModel[index].rating.rate.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[500]
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Count',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Text(
                    productsModel[index].rating.count.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[500]
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 55,
              child:  TextButton(
                onPressed: () async {
                  print('response =========================');
                  int response = await sqlDb.insertData(
                      'INSERT INTO StoreApp(title, category, price, image, fakeId) VALUES("${productsModel[index].title
                          }", "${productsModel[index].category}", "${productsModel[index].price}", "${productsModel[index].image}", "${productsModel[index].id}")');
                  print(response);

              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple[400]),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                maximumSize: MaterialStateProperty.all(Size.infinite)
              ), child:  const Text(
                'Add to cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                ),
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
