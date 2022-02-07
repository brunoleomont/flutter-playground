import 'package:flutter/cupertino.dart';
import 'package:playground/app/services/products_service.dart';
import 'package:playground/app/states/product_state.dart';

class ProductStore extends ValueNotifier<ProductState> {
  final ProductsService service;
  ProductStore(this.service) : super(InitialProductState());

  Future fetchProducts() async {
    value = LoadingProductState();
    try {
      final products = await service.fetchProducts();
      value = SuccessProductState(products);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }
}
