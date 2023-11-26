import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_1/provider/cart.dart';
import 'package:test_1/shared/appbar.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout Screen"),
        elevation: 0,
        backgroundColor: Colors.lightGreen,
        actions: const [
          Selectedandprice(),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 422,
              child: ListView.builder(
                itemCount: data.selectedItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(data.selectedItems[index].imgpath),
                      ),
                      title: Text(data.selectedItems[index].name),
                      subtitle: Text(
                          "\$${data.selectedItems[index].price} - ${data.selectedItems[index].location}"),
                      trailing: IconButton(
                        onPressed: () {
                          data.removeproduct(data.selectedItems[index]);
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(142, 157, 255, 0)),
              padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: const Text(
              "click here",
              style: TextStyle(fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }
}
