// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/datas/details_product.dart';
import 'package:e_commerce/models/featured_product.dart';
import 'package:e_commerce/screens/details_page/details_product.dart';
import 'package:e_commerce/screens/extract/my_app_bar.dart';
import 'package:e_commerce/screens/extract/pop_over.dart';
import 'package:e_commerce/screens/extract/product_tiles.dart';
import 'package:e_commerce/screens/extract/search_bar.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  const CategoryPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class SortirList {
  final String title;
  bool isActive;

  SortirList({required this.title, this.isActive = false});
}

class _CategoryPageState extends State<CategoryPage> {
  List<SortirList> sortir = [
    SortirList(title: "Name (A-Z)", isActive: true),
    SortirList(title: "Name (Z-A)", isActive: false),
    SortirList(title: "Price (High - Low)", isActive: false),
    SortirList(title: "Price (Low - High)", isActive: false),
  ];
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
                              product: detailsProduct[index],
                            ),
                          ),
                        );
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
                            Image.asset(
                              "assets/products/${product.image}.png",
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
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
                  setState(() async {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Popover(
                          content: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 25, 25, 20),
                            child: Column(
                              children: [
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final item = sortir[index];
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          item.isActive = !item.isActive;
                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                sortir[index].title,
                                                style: GoogleFonts.dmSans(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              if (item.isActive)
                                                SvgPicture.asset(
                                                    "assets/icons/check.svg"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const LineGap(),
                                  itemCount: sortir.length,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: navyBlack,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                          horizontal: 16,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Reset",
                                            style: GoogleFonts.dmSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: navyBlack,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Gap(15),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: blueOcean,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                          horizontal: 16,
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Apply",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: pureWhite,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          title: "Sortir",
                        );
                      },
                    );
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
