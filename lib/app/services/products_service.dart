import 'package:dio/dio.dart';
import 'package:playground/app/models/product_model.dart';

class ProductsService {
  final dio = Dio();
  ProductsService({required dio});
  Future<List<ProductModel>> fetchProducts() async {
    final response = await dio.get('http://localhost:3031/products');
    final list = response.data as List;
    final products = list.map((e) => ProductModel.fromMap(e)).toList();
    return products;
  }
}
