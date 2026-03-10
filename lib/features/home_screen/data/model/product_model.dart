import 'package:boarding2_machinetask/features/home_screen/domain/entity/product_entity.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final List<String> images;
  final double rating;
  final double price;
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.rating,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      images: (json["images"] as List).map((e) => e.toString()).toList(),
      rating: (json["rating"] as num).toDouble(),
      price: (json["price"] as num).toDouble(),
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      description: description,
      images: images,
      rating: rating,
      price: price,
    );
  }
}
