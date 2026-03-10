import 'package:dio/dio.dart';

class ProductDataSource {
  final Dio dio;

  ProductDataSource({required this.dio});

  final String baseUrl = "https://dummyjson.com";

  Future<dynamic> getProducts() async {
    final response = await dio.get("$baseUrl/products");
    final data = response.data;
    return data;
  }

  Future<dynamic> searchProducts(String query) async {
  final response = await dio.get(
    "$baseUrl/products/search",
    queryParameters: {
      "q": query,
    },
  );

  return response.data;
}

Future<dynamic> getCategories() async {
  final response = await dio.get("$baseUrl/products/categories");

  return response.data;
}

Future<dynamic> getProductsByCategory(String category) async {
  final response = await dio.get("$baseUrl/products/category/$category");

  return response.data;
}

}
