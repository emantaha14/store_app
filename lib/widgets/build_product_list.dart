import 'package:flutter/material.dart';
import 'package:store_app/widgets/product_item.dart';
import '../data_layer/global_data/models/products_model.dart';
import 'category_button.dart';
import 'default_text_field.dart';
import 'default_text_form_field.dart';

class ProductListView extends StatelessWidget {
  final List<ProductsModel> products;
  final Function(String) onSearchChanged;
  final VoidCallback allCategoriesCallback;
  final VoidCallback jeweleryCategoriesCallback;
  final VoidCallback electronicsCategoriesCallback;
  final VoidCallback menCategoriesCallback;
  final VoidCallback womenCategoriesCallback;

  const ProductListView({
    Key? key,
    required this.products,
    required this.onSearchChanged,
    required this.allCategoriesCallback,
    required this.jeweleryCategoriesCallback,
    required this.electronicsCategoriesCallback,
    required this.menCategoriesCallback,
    required this.womenCategoriesCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            onChanged: onSearchChanged ,
            labelText: 'Enter the category',
          ),

          CategoryButtons(
            allCategoriesCallback: allCategoriesCallback,
            jeweleryCategoriesCallback: jeweleryCategoriesCallback,
            electronicsCategoriesCallback: electronicsCategoriesCallback,
            menCategoriesCallback: menCategoriesCallback,
            womenCategoriesCallback: womenCategoriesCallback,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 3.04,
              ),
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) => ProductItem(
                products: products,
                index: index,
              ),
              itemCount: products.length,
            ),
          )
        ],
      ),
    );
  }
}
