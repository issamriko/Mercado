import 'package:flutter/material.dart';
import '../models/item.dart';

class Cart with ChangeNotifier {
  List selectedItems = [];
  double priceItem = 0;
  addproduct(Item products) {
    selectedItems.add(products);
    priceItem += products.price;
    notifyListeners();
  }

  removeproduct(Item product) {
    selectedItems.remove(product);
    priceItem -= product.price;
    notifyListeners();
  }

  get itemcount {
    return selectedItems.length;
  }
}
