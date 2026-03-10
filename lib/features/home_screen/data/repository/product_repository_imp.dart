import 'dart:convert';

import 'package:boarding2_machinetask/features/home_screen/data/datasource/product_api.dart';
import 'package:boarding2_machinetask/features/home_screen/data/model/product_model.dart';
import 'package:boarding2_machinetask/features/home_screen/domain/entity/product_entity.dart';
import 'package:boarding2_machinetask/features/home_screen/domain/repository/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductDataSource api;

  ProductRepositoryImp({required this.api});

  @override
  Future<List<ProductEntity>> getProducts() async {
    final data = await api.getProducts();
    List products = data['products'];
    return products
        .map((json) => ProductModel.fromJson(json).toEntity())
        .toList();
  }

  @override
  Future<List<ProductEntity>> searchProducts(String query) async {
    final data = await api.searchProducts(query);
    List products = data['products'];
    return products
        .map(
          (json) => ProductModel.fromJson(json).toEntity()
        )
        .toList();
  }

  Future<List<String>> getCategories() async {
    final data = await api.getCategories();
    return List<String>.from(data);
  }

  @override
Future<List<ProductEntity>> getProductsByCategory(String category) async {
  final data = await api.getProductsByCategory(category);

  List products = data['products'];

  return products
      .map((json) => ProductModel.fromJson(json).toEntity())
      .toList();
}
}
