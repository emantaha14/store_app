import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/business_logic_layer/products_cubit/products_cubit.dart';
import 'package:store_app/widgets/show_loading_indicator.dart';
import '../data_layer/local_data/products_db.dart';
import '../widgets/build_product_list.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  late String selectedCategory;
  ProductsDb sqlDb = ProductsDb();

  @override
  void initState() {
    super.initState();
    selectedCategory = BlocProvider.of<ProductsCubit>(context).selectedCategory;
    BlocProvider.of<ProductsCubit>(context).getAllProducts(selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return ProductListView(
              products: state.products,
              onSearchChanged: (value) {
                context.read<ProductsCubit>().filteredProducts(value);
              },
              allCategoriesCallback: () {
                context.read<ProductsCubit>().allCategories();
                updateProducts(context);
              },
              jeweleryCategoriesCallback: () {
                context.read<ProductsCubit>().jeweleryCategories();
                updateProducts(context);
              },
              electronicsCategoriesCallback: () {
                context.read<ProductsCubit>().electronicsCategories();
                updateProducts(context);
              },
              menCategoriesCallback: () {
                context.read<ProductsCubit>().menCategories();
                updateProducts(context);
              },
              womenCategoriesCallback: () {
                context.read<ProductsCubit>().womenCategories();
                updateProducts(context);
              },
            );
          } else if (state is ProductsFilteredState) {
            return ProductListView(
              products: state.filteredProducts,
              onSearchChanged: (value) {
                context.read<ProductsCubit>().filteredProducts(value);
              },
              allCategoriesCallback: () {
                context.read<ProductsCubit>().allCategories();
                updateProducts(context);
              },
              jeweleryCategoriesCallback: () {
                context.read<ProductsCubit>().jeweleryCategories();
                updateProducts(context);
              },
              electronicsCategoriesCallback: () {
                context.read<ProductsCubit>().electronicsCategories();
                updateProducts(context);
              },
              menCategoriesCallback: () {
                context.read<ProductsCubit>().menCategories();
                updateProducts(context);
              },
              womenCategoriesCallback: () {
                context.read<ProductsCubit>().womenCategories();
                updateProducts(context);
              },
            );
          } else {
            return const ShowLoadingIndicator();
          }
        },
    );
  }

  void updateProducts(BuildContext context) {
    selectedCategory = context.read<ProductsCubit>().selectedCategory;
    BlocProvider.of<ProductsCubit>(context).getAllProducts(selectedCategory);
  }
}

