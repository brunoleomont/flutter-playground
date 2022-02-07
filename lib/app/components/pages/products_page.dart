import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:playground/app/services/products_service.dart';
import 'package:playground/app/states/product_state.dart';
import 'package:playground/app/store/product_store.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final store = ProductStore(ProductsService(Dio()));

  @override
  void initState() {
    super.initState();
    store.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (_, state, child) {
          if (state is LoadingProductState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorProductState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is SuccessProductState) {
            return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (_, index) {
                  final product = state.products[index];
                  return ListTile(
                    title: Text(product.title),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
