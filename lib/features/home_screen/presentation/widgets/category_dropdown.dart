import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product/product_bloc.dart';

class CategoryDropdownScreen extends StatelessWidget {
  const CategoryDropdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is CatogaryLoaded) {
          String selectedCategory = state.catogaries.first;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                const Text(
                  "Select Category:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedCategory,
                    items: state.catogaries
                        .map((category) => DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        // Dispatch event to BLoC
                        context
                            .read<ProductBloc>()
                            .add(GetCategoriesEvent(value));
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }

        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return const SizedBox();
      },
    );
  }
}