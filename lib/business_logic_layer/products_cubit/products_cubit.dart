import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data_layer/global_data/models/products_model.dart';
import '../../data_layer/global_data/repository/products_repo.dart';


part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;

  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  List<ProductsModel> allProducts = [];

  String selectedCategory = '';

  void jeweleryCategories() {
    selectedCategory = 'category/jewelery';
    emit(ProductsLoaded(allProducts));
  }

  void electronicsCategories() {
    selectedCategory = 'category/electronics';
    emit(ProductsLoaded(allProducts));
  }

  void menCategories() {
    selectedCategory = 'category/men\'s clothing';
    emit(ProductsLoaded(allProducts));
  }

  void womenCategories() {
    selectedCategory = 'category/women\'s clothing';
    emit(ProductsLoaded(allProducts));
  }

  void allCategories() {
    selectedCategory = '';
    emit(ProductsLoaded(allProducts));
  }

  Future<void> getAllProducts(String category) async {
    allProducts = await ProductsRepo.getAllProducts(category);
    print(category);
    emit(ProductsLoaded(allProducts));
  }

  void filteredProducts(String category) {
    if (category.isEmpty) {
      emit(ProductsLoaded(allProducts));
    } else {
      final filteredProducts = allProducts
          .where((element) => element.title.toLowerCase().startsWith(category))
          .toList();
      emit(ProductsFilteredState(filteredProducts));
    }
  }

}
