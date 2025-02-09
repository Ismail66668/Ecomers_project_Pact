import 'package:ecommer_app_ui/model/product_model.dart';
import 'package:ecommer_app_ui/screen/cardpage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Productdetels extends StatefulWidget {
  String image;
  double price;
  String detlse;
  String name;
  Productdetels(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.detlse});

  @override
  State<Productdetels> createState() => _ProductdetelsState();
}

class _ProductdetelsState extends State<Productdetels> {
  List<ProductModel> addtocard = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("New callection ${widget.name}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18)),
                    color: Colors.white),
                child: Center(
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(18),
                          topLeft: Radius.circular(18)),
                      color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price: ${widget.price}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                        Text("Detels:  ${widget.detlse}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18))),
            height: 60,
            width: double.infinity,
            child: TextButton(
                onPressed: () {
                  addtocard.add(ProductModel(
                      details: widget.detlse,
                      price: (widget.price),
                      image: widget.image,
                      name: widget.name));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardPage(cardlist: addtocard)));
                },
                child: const Text(
                  "Add To Card",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )),
          )
        ],
      ),
    );
  }
}
