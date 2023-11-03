import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/screens/extract/my_app_bar.dart';

class DetailsProduct extends StatefulWidget {
  final String image;
  const DetailsProduct({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Details Product",
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              const Text("1/5 Foto"),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 35,
                  horizontal: 35,
                ),
                child: Image.asset(
                  alignment: Alignment.center,
                  "assets/products/${widget.image}.png",
                  width: 305,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
