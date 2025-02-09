// ignore: depend_on_referenced_packages
import 'package:ecommer_app_ui/model/product_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardPage extends StatefulWidget {
  CardPage({super.key, this.cardlist});

  List<ProductModel>? cardlist;

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  var netPrice;
  void getTotal() {
    netPrice = widget.cardlist!
        .map((item) => item.price!.toInt() * item.quntaty)
        .reduce((value, element) => value + element);
  }

  @override
  void initState() {
    widget.cardlist!.length > 1 ? getTotal() : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Total item is ${widget.cardlist?.length}"),
        actions: const [Icon(Icons.delete)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.cardlist?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent.shade200,
                          borderRadius: BorderRadius.circular(12)),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "${widget.cardlist![index].image}",
                            height: 40,
                            width: 50,
                          ),
                          Text("${widget.cardlist![index].name}"),
                          Text(
                              "${widget.cardlist![index].price! * widget.cardlist![index].quntaty}"),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  widget.cardlist![index].quntaty > 0
                                      ? widget.cardlist![index].quntaty--
                                      : widget.cardlist!.removeAt(index);
                                  getTotal();
                                  setState(() {});
                                },
                                child: Icon(Icons.remove),
                              ),
                              Text("${widget.cardlist![index].quntaty}"),
                              InkWell(
                                onTap: () {
                                  widget.cardlist![index].quntaty++;
                                  getTotal();
                                  setState(() {});
                                },
                                child: Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(12)),
              child: MaterialButton(
                onPressed: () {},
                child: Text("Total Price=${netPrice ?? 0}"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
