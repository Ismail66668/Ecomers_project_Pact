import 'package:ecommer_app_ui/model/product_model.dart';
import 'package:ecommer_app_ui/screen/cardpage.dart';
import 'package:ecommer_app_ui/screen/home_screen/widget/catagori.dart';
import 'package:ecommer_app_ui/screen/productdetels.dart';
import 'package:flutter/material.dart';

import 'widget/curosel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> selectproduct = [];

  @override
  Widget build(BuildContext context) {
    List myProductlist = productList;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Center(child: Text("My Shope")),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CardPage(cardlist: selectproduct)));
                  },
                  icon: const Icon(Icons.shopping_cart_checkout)),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        "${selectproduct.length}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
          Colors.black.withOpacity(0.6),
          Colors.black.withOpacity(0.7),
          Colors.black.withOpacity(0.5),
        ])),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const CuroselWidget(),
            const SizedBox(
              height: 10,
            ),
            const CatagoriWidget(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 240,
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                // ignore: avoid_unnecessary_containers
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Productdetels(
                                        name: "${productList[index].name}",
                                        price: double.parse(
                                            "${productList[index].price}"),
                                        detlse: "${productList[index].details}",
                                        image: "${productList[index].image}")));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Image.asset(
                              "${myProductlist[index].image}",
                              height: 120,
                              width: double.infinity,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${myProductlist[index].name}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${myProductlist[index].rating}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Text(
                              "${myProductlist[index].brand}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${myProductlist[index].price}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                IconButton(
                                    onPressed: () {
                                      try {
                                        selectproduct.firstWhere((element) =>
                                            element.id ==
                                            productList[index].id);
                                        var snackBar = const SnackBar(
                                            content: Text('Already Add'));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      } catch (e) {
                                        selectproduct.add(productList[index]);
                                        setState(() {});
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.shopping_cart,
                                      size: 26,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      )

                      // Text(
                      //   "${productList[index].details}",
                      //   style: const TextStyle(),
                      //   maxLines: 2,
                      // ),
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
