import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:boarding2_machinetask/features/home_screen/domain/entity/product_entity.dart';
import 'package:boarding2_machinetask/features/home_screen/domain/usecase/product_usecase.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUseCase getProductUseCase;
  Timer? _debounce;
  ProductBloc(this.getProductUseCase) : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      
      emit(ProductLoading());
      try {
        
      final products =await getProductUseCase.callProduct();
      emit(ProductLoaded(products,1));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
    });
    on<ChangePageEvent>((event, emit) {
      if (state is ProductLoaded) {

        final currentState = state as ProductLoaded;

        emit(ProductLoaded(
          currentState.products,
          event.page,
        ));

      }
    });

  on<SearchProductEvent>((event, emit) async {

  if (_debounce?.isActive ?? false) _debounce!.cancel();

  

    emit(ProductLoading());

    try {

      final products =
          await getProductUseCase.callSearch(event.query);

      emit(ProductLoaded(products, 1));

    } catch (e) {
      emit(ProductError(e.toString()));
    }

 

});
on<GetCategoriesEvent>((event, emit) async {
  emit(ProductLoading());

  final categories = await getProductUseCase.callCatogaries();

  emit(CatogaryLoaded(categories));
});
  }
}
