import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_1/auth/login.dart';
import 'package:test_1/screens/checkout.dart';
import 'package:test_1/screens/details.dart';
import 'package:test_1/shared/appbar.dart';
import '../models/item.dart';
import '../provider/cart.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff81be4d),
        title: const Text("Details screen"),
        actions: const [
          Selectedandprice(),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        width: 300,
        child: Column(
          children: [
            const Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("asset/images/2.jpg"),
                  ),
                  accountEmail: Text(
                    "issamriko9@gmail.com",
                    style: TextStyle(color: Colors.black87),
                  ),
                  accountName: Text(
                    "issam Mabroukia",
                    style: TextStyle(color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("asset/images/1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Homescreen();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text("My product"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Checkout();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_center),
              title: const Text("About"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Homescreen();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Signin(),
                    ),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(product: items[index]),
                ));
          },
          child: GridTile(
            footer: GridTileBar(
              leading: Text(" \$${items[index].price}"),
              trailing: IconButton(
                onPressed: () {
                  data.addproduct(items[index]);
                },
                icon: const Icon(Icons.add),
                color: Colors.black87,
              ),
              title: const Text(""),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(items[index].imgpath),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
