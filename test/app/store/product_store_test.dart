import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:playground/app/services/products_service.dart';
import 'package:playground/app/states/product_state.dart';
import 'package:playground/app/store/product_store.dart';

class ProductServiceMock extends Mock implements ProductsService {}

void main() {
  final service = ProductServiceMock();
  final store = ProductStore(service);
  test('deve alterar estado para success', () async {
    when(() => service.fetchProducts()).thenAnswer((_) async => []);
    await store.fetchProducts();
    expect(store.value, isA<SuccessProductState>());
  });
  test('deve alterar estado para error', () async {
    when(() => service.fetchProducts()).thenThrow(Exception('Error'));
    await store.fetchProducts();
    expect(store.value, isA<ErrorProductState>());
  });
}
