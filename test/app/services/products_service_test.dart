import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:playground/app/services/products_service.dart';

class DioMock extends Mock implements Dio {}
class RequestMock extends Mock implements RequestOptions {}

void main() {
  final dioMock = DioMock();
  final service = ProductsService(dio: dioMock);

  final jsonResponse = jsonDecode(r'''
  [
  {
    "id": "0",
    "title": "Flutter 2"
  },
  {
    "id": "1",
    "title": "React Native"
  },
  {
    "title": "Ionic",
    "id": "2"
  }
  ]
  ''');

    test('deve pegar todos os produtos', () async {
    when(()=>dioMock.get(any())).thenAnswer(
      (_) async => Response(
      data: jsonResponse, 
      statusCode: 200,
      requestOptions: RequestMock()));
    final products = await service.fetchProducts();
    expect(products[0].title, 'Flutter 2');
  });
}
