import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gotop/models/product_model.dart';

class ProductService {
  // String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<List<ProductModel>> getProducts() async {
    var url = 'http://192.168.137.229:8000/api/products';
    // var headers = {'Content-Type': 'application/json'};
    //  headers: headers

    var response = await http.get(Uri.parse(url));

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
