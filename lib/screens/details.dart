import 'package:flutter/material.dart';
import 'package:test_1/models/item.dart';
import 'package:test_1/shared/appbar.dart';
import 'package:test_1/shared/star_icon.dart';


class Details extends StatefulWidget {
  final Item product;
  const Details({super.key, required this.product});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool ismaxline = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff81be4d),
        title: const Text("Details screen"),
        actions: const [
          Selectedandprice(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.product.imgpath), //lazm ndiro widget. stateful
            const SizedBox(height: 12),
            Text("\$${widget.product.price}",
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 5),
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        color: Color.fromARGB(220, 237, 56, 43)),
                    padding: const EdgeInsets.all(5),
                    child: const Text("New")),
                const SizedBox(width: 10),
                const Staricon(),
                const Staricon(),
                const Staricon(),
                const Staricon(),
                const Staricon(),
                const SizedBox(width: 40),
                const Icon(Icons.map),
                Text(widget.product.location),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: double.infinity,
              child: Text("Details:",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 5),
            Text(
              "A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers produce gametophytes, which in flowering plants consist of a few haploid cells which produce gametes. The  gametophyte, which produces non-motile sperm, is enclosed within pollen grains; the  gametophyte is contained within the ovule. When pollen from the anther of a flower is deposited on the stigma, this is called pollination. Some flowers may self-pollinate, producing seed using pollen from the same flower or a different flower of the same plant, but others have mechanisms to prevent self-pollination and rely on cross-pollination, when pollen is transferred from the anther of one flower to the stigma of another flower on a different individual of the same species.",
              maxLines: ismaxline ? 3 : null,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  ismaxline = !ismaxline;
                });
              },
              child: Text(ismaxline ? "Show more" : "Show less"),
            ),
          ],
        ),
      ),
    );
  }
}
