import 'package:boarding2_machinetask/features/home_screen/presentation/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDropdownScreen extends StatefulWidget {
  const CategoryDropdownScreen({super.key});

  @override
  State<CategoryDropdownScreen> createState() =>
      _CategoryDropdownScreenState();
}

class _CategoryDropdownScreenState extends State<CategoryDropdownScreen> {

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {

    final bloc = context.watch<ProductBloc>();

    if (bloc.categories.isEmpty) {
      return const SizedBox();
    }

    selectedCategory ??= bloc.categories.first;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [

          const Text(
            "Select Category",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 91, 91, 91)),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1), // border color & width
      borderRadius: BorderRadius.circular(8),),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedCategory,
              
                items: bloc.categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(left: 15),
                      child: Text(category,style: TextStyle(fontSize: 20),)),
                  );
                }).toList(),
              
                onChanged: (value) {
              
                  setState(() {
                    selectedCategory = value!;
                  });
              
                  context.read<ProductBloc>().add(
                    GetProductsByCategoryEvent(value!),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}