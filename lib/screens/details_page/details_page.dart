// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/datas/details_product.dart';
import 'package:e_commerce/models/featured_product.dart';
import 'package:e_commerce/screens/details_page/details_product.dart';
import 'package:e_commerce/screens/extract/my_app_bar.dart';
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
      appBar: const MyAppBar(
        title: "Category",
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 120),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 21,
                    mainAxisExtent: 240,
                    crossAxisSpacing: 13,
                  ),
                  itemCount: detailsProduct.length,
                  itemBuilder: (context, index) {
                    Product product = detailsProduct[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsProduct(
                                      image: detailsProduct[index]
                                          .image
                                          .toString(),
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.black.withOpacity(0.05),
                              offset: const Offset(0, 1),
                            ),
                          ],
                          color: pureWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/products/${product.image}.png"),
                            const SizedBox(
                              height: 20,
                            ),
                            //Title
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.nameProduct,
                                  style: GoogleFonts.dmSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.2,
                                    color: navyBlack,
                                  ),
                                ),

                                //Price
                                Text(
                                  CurrencyIDR.convertToIdr(product.price, 0),
                                  style: GoogleFonts.dmSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.2,
                                    color: redVelvet,
                                  ),
                                ),

                                const SizedBox(
                                  height: 10.5,
                                ),

                                //Rating & Review
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        //Rating
                                        SvgPicture.asset(
                                          "assets/icons/star.svg",
                                          width: 11,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          product.rating.toString(),
                                          style: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),

                                        //Review
                                        Text(
                                          "${product.review.toInt()} Reviews",
                                          style: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                      ],
                                    ),

                                    //dots Icon

                                    SvgPicture.asset(
                                        "assets/icons/menu-dots-vertical.svg")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                    // return ProductItemWidget(productItem: product);
                  },
                ),
              ],
            ),
          ),
          //Filter Sortir
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    print("hello");
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: pureWhite,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: navyBlack,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "Filter & Sortir",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: navyBlack,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
