part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class GetProductEvent extends ProductEvent {
  final int page;

  GetProductEvent({required this.page});
}

class SearchProductEvent extends ProductEvent {
  final String query;

  SearchProductEvent(this.query);
}

class ChangePageEvent extends ProductEvent {
  final int page;

  ChangePageEvent(this.page);
}

class GetCategoriesEvent extends ProductEvent {
  final String categories;

  GetCategoriesEvent(this.categories);
}
