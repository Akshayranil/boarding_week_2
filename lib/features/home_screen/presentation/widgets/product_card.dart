import 'package:boarding2_machinetask/features/home_screen/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            /// IMAGE WITH FAVORITE ICON
            Expanded(
              child: Stack(
                children: [
        
                  /// IMAGE
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: Image.network(
                        product.images[0],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
        
                  /// FAVORITE ICON
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 178, 175, 175),           // white square background
                        borderRadius: BorderRadius.circular(6), // slightly rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border, // outlined heart icon
                          size: 20,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // TODO: add favorite functionality
                        },
                      ),
                    ),
                  ),
        
                ],
              ),
            ),
        
            /// DETAILS
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        
                  const SizedBox(height: 4),
        
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
        
                  const SizedBox(height: 6),
        
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}