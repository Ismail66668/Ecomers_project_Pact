import 'package:ecommer_app_ui/model/product_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CatagoriWidget extends StatefulWidget {
  const CatagoriWidget({super.key});

  @override
  State<CatagoriWidget> createState() => _CatagoriWidgetState();
}

class _CatagoriWidgetState extends State<CatagoriWidget> {
  @override
  Widget build(BuildContext context) {
    final List catagoris = circleList;
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.shade200, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MostPoplur",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "See All",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(8)),
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catagoris.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.4),
                        shape: BoxShape.circle),
                    child: InkWell(
                      onTap: () {
                        //
                      },
                      child: Image.asset(
                        catagoris[index],
                        height: 80,
                        width: 80,
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
