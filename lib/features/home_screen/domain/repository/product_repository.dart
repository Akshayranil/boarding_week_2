import 'package:boarding2_machinetask/features/home_screen/domain/entity/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
  Future<List<ProductEntity>> searchProducts(String query);
  Future<List<String>> getCategories();
  Future<List<ProductEntity>> getProductsByCategory(String category);
}
