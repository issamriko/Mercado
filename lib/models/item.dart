class Item {
  String imgpath;
  double price;
  String location;
  String name;
  Item(
      {required this.name,
      required this.imgpath,
      required this.price,
      this.location = "cherage"});
}

final List<Item> items = [
  Item(name: "product 1", imgpath: "asset/images/1.webp", price: 29.00),
  Item(name: "product 2", imgpath: "asset/images/2.webp", price: 30.00),
  Item(name: "product 3", imgpath: "asset/images/3.webp", price: 60.00),
  Item(name: "product 4", imgpath: "asset/images/4.webp", price: 23.00),
  Item(name: "product 5", imgpath: "asset/images/5.webp", price: 100.00),
  Item(name: "product 6", imgpath: "asset/images/6.webp", price: 245.00),
  Item(name: "product 7", imgpath: "asset/images/7.webp", price: 231.00),
];
