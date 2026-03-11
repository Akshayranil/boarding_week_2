import 'package:boarding2_machinetask/features/home_screen/domain/entity/product_entity.dart';
import 'package:boarding2_machinetask/features/home_screen/domain/repository/product_repository.dart';

class GetProductUseCase {
  final ProductRepository repository;

  GetProductUseCase({required this.repository});

  Future<List<ProductEntity>> callProduct() async {
    return await repository.getProducts();
  }

  Future<List<ProductEntity>> callSearch(String query) async {
    return await repository.searchProducts(query);
  }

  Future<List<String>> callCatogaries() async {
    return await repository.getCategories();
  }

  Future<List<ProductEntity>> callCategoryProducts(String category) async {
  return await repository.getProductsByCategory(category);
}
}
