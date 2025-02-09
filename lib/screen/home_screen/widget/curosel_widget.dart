import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';

class CuroselWidget extends StatefulWidget {
  const CuroselWidget({super.key});

  @override
  State<CuroselWidget> createState() => _CuroselWidgetState();
}

class _CuroselWidgetState extends State<CuroselWidget> {
  List slide = [
    "assets/images/login.jpeg",
    "assets/images/product1.png",
    "assets/images/login.jpeg",
    "assets/images/welcome.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: slide.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage("${slide[itemIndex]}"),
                    fit: BoxFit.cover)),
            child: const Text(""),
          ),
          options: CarouselOptions(
            height: 170,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
