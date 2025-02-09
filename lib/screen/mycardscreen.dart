import 'package:ecommer_app_ui/model/product_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mycardscreen extends StatefulWidget {
  Mycardscreen({super.key, required this.productlist});

  List<ProductModel>? productlist;

  @override
  State<Mycardscreen> createState() => _MycardscreenState();
}

class _MycardscreenState extends State<Mycardscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: widget.productlist?.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset("${widget.productlist?[index].image}"),
                title: Text("${widget.productlist?[index].name}"),
                trailing: Text("${widget.productlist?[index].price}"),
              );
            },
          ))
        ],
      ),
    );
  }
}
