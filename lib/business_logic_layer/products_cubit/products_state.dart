part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

 class ProductsLoaded extends ProductsState {
  final List<ProductsModel> products;
  ProductsLoaded(this.products);
}

class ProductsFilteredState extends ProductsState{
  final List<ProductsModel> filteredProducts;
  ProductsFilteredState(this.filteredProducts);
}
