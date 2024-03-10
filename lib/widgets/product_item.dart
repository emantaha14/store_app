import 'package:flutter/material.dart';
import 'package:store_app/presentations_layer/product_detials_screen.dart';
import '../data_layer/global_data/models/products_model.dart';
import '../data_layer/local_data/favourite_products_db.dart';

class ProductItem extends StatefulWidget {
  final List<ProductsModel> products;
  final int index;

  const ProductItem({super.key, required this.products, required this.index});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int favouriteColorChange = 0;
  FavouriteProductsDb favouriteProductsDb = FavouriteProductsDb();
  Future<List<Map>> readData() async {
    List<Map> response = await favouriteProductsDb.readData('SELECT * FROM FavouriteProducts WHERE fakeId = ${widget.products[widget.index].id}');
    print(response);
    return response;
  }
  @override
  void initState() {
    readData().then((value) {
      setState(() {
        favouriteColorChange = value.isEmpty?0:1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetails(
                    productsModel: widget.products,
                    index: widget.index,
                  )),
        );
      },
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.purple[50],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(widget.products[widget.index].image),
                      // Replace with your image path
                      fit: BoxFit.fill, // Adjust BoxFit according to your needs
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  widget.products[widget.index].title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Price',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Text(
                    '\$${widget.products[widget.index].price}',
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                        if (favouriteColorChange == 0) {
                          setState(() {
                            favouriteColorChange = 1;
                          });
                          int response = await favouriteProductsDb.insertData(
                              'INSERT INTO FavouriteProducts(title, category, price, image, fakeId) VALUES("${widget.products[widget.index].title}", "${widget.products[widget.index].category}", "${widget.products[widget.index].price}","${widget.products[widget.index].image}","${widget.products[widget.index].id}")');
                          if (response > 0) {
                            print('$response======================');
                          }
                        } else if (favouriteColorChange == 1) {
                          setState(() {
                            favouriteColorChange = 0;
                          });
                          int response = await favouriteProductsDb.deleteData("DELETE FROM FavouriteProducts WHERE fakeId = ${widget.products[widget.index].id} ");
                          if(response > 0){
                            print('$response======================');
                          }
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: favouriteColorChange == 1
                            ? Colors.black
                            : Colors.grey[500],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
