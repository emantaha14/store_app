import '../models/login_store_app_model.dart';
import '../models/products_model.dart';
import '../web_services/web_services.dart';

class ProductsRepo {
  WebServices webServices = WebServices();

  ProductsRepo(this.webServices);

  static Future<List<ProductsModel>> getAllProducts(String category) async {
    final getAllProducts = await WebServices.getAllProducts(category);
    return getAllProducts;
  }

  static Future<UserData> postProducts(String username, String password) async {
    final postProducts = await WebServices.postProducts(username,password);
    return postProducts;
  }
}
