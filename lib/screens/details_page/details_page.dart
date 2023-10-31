// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/datas/details_product.dart';
import 'package:e_commerce/models/featured_product.dart';
import 'package:e_commerce/screens/extract/product_tiles.dart';
import 'package:e_commerce/screens/extract/search_bar.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  const DetailsPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: pureWhite,
        elevation: 0,
        toolbarHeight: 99,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(null),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(null),
                ],
              ),
              Text(
                "Details Product",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  color: blueOcean,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/bell.svg"),
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset("assets/icons/shoping-cart.svg"),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: Text(
                widget.title,
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SearchBarWidget(),

            //Card widget
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 21,
                mainAxisExtent: 240,
                crossAxisSpacing: 13,
              ),
              itemCount: detailsProduct.length,
              itemBuilder: (context, index) {
                Product product = detailsProduct[index];
                return Container(
                  decoration: BoxDecoration(
                    color: blueOcean,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(product.nameProduct),
                    ],
                  ),
                );
                // return ProductItemWidget(productItem: product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
