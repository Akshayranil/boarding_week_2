import 'package:boarding2_machinetask/features/home_screen/presentation/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget pageButton(BuildContext context, int page, int currentPage) {
  return GestureDetector(
    onTap: () {
      context.read<ProductBloc>().add(ChangePageEvent(page));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: currentPage == page ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        page.toString(),
        style: TextStyle(
          color: currentPage == page ? Colors.white : Colors.black,
        ),
      ),
    ),
  );
}