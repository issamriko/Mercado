import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_1/screens/checkout.dart';
import '../provider/cart.dart';

class Selectedandprice extends StatelessWidget {
  const Selectedandprice({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Cart>(context);
    return Row(
      children: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Checkout()),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
            ),
            Positioned(
              bottom: 23,
              left: 2,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black45),
                child: Text("${data.itemcount}"),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text("\$ ${data.priceItem.ceil()}"),
        ),
      ],
    );
  }
}
