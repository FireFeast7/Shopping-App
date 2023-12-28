import 'package:flutter/material.dart';
import 'package:task/views/ItemDetail.dart';

class ProductList extends StatelessWidget {
  final dynamic item;

  const ProductList({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: item.length,
      itemBuilder: (context, index) {
        final product = item[index];
        return ProductCard(product: product);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final dynamic product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ItemDetail(item: product)));
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              children: [
                Image.network(
                  product['image'],
                  width: 200,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        product['title'],
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Text(
                        product['description'],
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 11,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product['price']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_shopping_cart),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
