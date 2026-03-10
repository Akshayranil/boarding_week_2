part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductEntity> products;
  final int currentPage;
  ProductLoaded(this.products, this.currentPage);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}

class CatogaryLoaded extends ProductState {
  final List<String> catogaries;

  CatogaryLoaded(this.catogaries);

}
