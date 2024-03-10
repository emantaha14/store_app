import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/data_layer/global_data/models/login_store_app_model.dart';

import '../models/products_model.dart';

class WebServices {
  static Future<List<ProductsModel>> getAllProducts(String category) async {
    Uri url = Uri.parse('$BaseUrl/products/$category');
    Response response = await get(url);

    if (response.statusCode == 200) {
      print(response.body.toString());
      final returnedData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return returnedData
          .map<ProductsModel>((item) => ProductsModel.fromJson(item))
          .toList();
    } else {
      throw Exception('error there is no data returned');
    }
  }

  static Future<UserData> postProducts(String username, String password) async{
    Uri url = Uri.parse('$BaseUrl/auth/login');
    final Response response = await post(url,
    headers: <String, String>{
      'Content-Type' : 'application/json'
    },
    body: jsonEncode({
      "username": username,
      "password":password,
    }));

    if(response.statusCode == 200){
      print(response.body);
      return UserData.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('error there is no post data returned');
    }
  }
}
