import 'package:boarding2_machinetask/features/home_screen/presentation/bloc/product/product_bloc.dart';
import 'package:boarding2_machinetask/features/home_screen/presentation/widgets/arrow.dart';
import 'package:boarding2_machinetask/features/home_screen/presentation/widgets/category_dropdown.dart';
import 'package:boarding2_machinetask/features/home_screen/presentation/widgets/page_button.dart';
import 'package:boarding2_machinetask/features/home_screen/presentation/widgets/product_card.dart';
import 'package:boarding2_machinetask/features/home_screen/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("MoBooM"),
      ),
      body: Column(
        children: [
          SearchBarScreen(),
          CategoryDropdownScreen(),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {

                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ProductLoaded) {
                  final products = state.products;
                  final currentPage = state.currentPage;

                  int itemsPerPage = 6;
                  final totalPages = (products.length / itemsPerPage).ceil();

                  final startIndex = (currentPage - 1) * itemsPerPage;
                  final endIndex = startIndex + itemsPerPage;

                  final paginatedProducts = products.sublist(
                    startIndex,
                    endIndex > products.length ? products.length : endIndex,
                  );

                  return CustomScrollView(
  slivers: [

    /// PRODUCT GRID
    SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = paginatedProducts[index];
            return ProductCard(product: product);
          },
          childCount: paginatedProducts.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    ),

    /// PAGINATION
    SliverToBoxAdapter(
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        /// LEFT ARROW
        arrowButton(
  context,
  Icons.chevron_left,
  currentPage > 1
      ? () {
          context
              .read<ProductBloc>()
              .add(ChangePageEvent(currentPage - 1));
        }
      : null,
),

        /// PAGE 1
        pageButton(context, 1, currentPage),

        const SizedBox(width: 8),

        /// PAGE 2
        if (totalPages > 1)
          pageButton(context, 2, currentPage),

        const SizedBox(width: 8),

        /// DOTS
        if (totalPages > 3)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text("..."),
          ),

        /// LAST PAGE
        if (totalPages > 2)
          pageButton(context, totalPages, currentPage),

        /// RIGHT ARROW
        arrowButton(
  context,
  Icons.chevron_right,
  currentPage < totalPages
      ? () {
          context
              .read<ProductBloc>()
              .add(ChangePageEvent(currentPage + 1));
        }
      : null,
),
      ],
    ),
  ),
)
  ],
);
                }

                if (state is ProductError) {
                  return Center(child: Text(state.message));
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}