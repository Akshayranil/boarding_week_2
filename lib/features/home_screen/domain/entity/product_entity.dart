class ProductEntity {
  final int id;
  final String title;
  final String description;
  final List<String>  images;
  final double rating;
  final double price;
  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.rating,
    required this.price
  });
}
