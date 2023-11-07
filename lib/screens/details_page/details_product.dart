import 'package:e_commerce/datas/product.dart';
import 'package:e_commerce/datas/review.dart';
import 'package:e_commerce/models/featured_product.dart';
import 'package:e_commerce/screens/extract/my_app_bar.dart';
import 'package:e_commerce/screens/extract/product_tiles.dart';
import 'package:e_commerce/screens/extract/title_bar.dart';
import 'package:e_commerce/screens/seller_page/info_seller.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class DetailsProduct extends StatefulWidget {
  final Product product;
  const DetailsProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class ProductNavBar {
  final String text;
  final Icon icon;
  final Color color;

  ProductNavBar({
    required this.icon,
    required this.text,
    required this.color,
  });
}

class _DetailsProductState extends State<DetailsProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Details Product",
        hasLeftIcon: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //Hero
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 35,
                    horizontal: 35,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      const Text("1/5 Foto"),
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          alignment: Alignment.center,
                          "assets/products/${widget.product.image}.png",
                          width: 305,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(5),
                //content
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.nameProduct,
                        style: GoogleFonts.dmSans(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                          color: navyBlack,
                        ),
                      ),

                      //Price
                      Text(
                        CurrencyIDR.convertToIdr(widget.product.price, 0),
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          color: redVelvet,
                        ),
                      ),

                      const Gap(10.5),
                      //Rating & Review
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                widget.product.rating.toString(),
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              const Gap(10),

                              //Review
                              Text(
                                "${widget.product.review.toInt()} Reviews",
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),

                          //Availibility
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: offGreen,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Tersedia : ${widget.product.availability}",
                              style: GoogleFonts.dmSans(
                                color: earthGreen,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const LineGap(),
                //Store Name
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoSeller(
                            product: widget.product.rating.toString(),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/user/store.png",
                                width: 45,
                              ),
                            ),
                            const Gap(20),
                            //Name & Information Store
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Name
                                Text(
                                  "Shop Larson Electronic",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Official Store",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: .2,
                                      ),
                                    ),
                                    const Gap(5),
                                    SvgPicture.asset("assets/icons/shield.svg")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Right Button
                        Icon(
                          IconlyLight.arrow_right_2,
                          size: 20,
                          color: darkGrey,
                        )
                      ],
                    ),
                  ),
                ),

                const LineGap(),

                //Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Descritption",
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(15),
                      Text(
                        "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
                        style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: .2),
                      ),
                      const Gap(15),
                      Text(
                        "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.",
                        style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: .2),
                      ),
                    ],
                  ),
                ),

                const LineGap(),

                //Review
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Review(${review.length})",
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/star-filled.svg"),
                              const Gap(3),
                              Text(
                                widget.product.rating.toString(),
                                style: GoogleFonts.dmSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Gap(30),
                      //Review Content
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final currentReview = review[index];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/avatar/${review[index].avatar}.png"),
                              ),
                              const Gap(15),
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            review[index].name,
                                            style: GoogleFonts.dmSans(
                                              letterSpacing: 0.2,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            review[index].date,
                                            style: GoogleFonts.dmSans(
                                              color: darkGrey,
                                              letterSpacing: 0.2,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(5),
                                      Row(
                                        children: [
                                          for (int i = 0; i < 5; i++)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 2),
                                              child: SvgPicture.asset(
                                                i < currentReview.starCount
                                                    ? "assets/icons/star-filled.svg"
                                                    : "assets/icons/star-outlined.svg",
                                                width: 16,
                                              ),
                                            ),
                                        ],
                                      ),
                                      const Gap(11),
                                      Text(
                                        review[index].description,
                                        style: GoogleFonts.dmSans(
                                          height: 2,
                                          letterSpacing: .2,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: review.length,
                        separatorBuilder: (context, index) {
                          return const Gap(20);
                        },
                      ),

                      //Button To Collapse
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          width: 440,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: navyBlack,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "See All Reviews",
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: navyBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Featured Product
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 24),
                  child: TitleBar(title: "Featured Product"),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: featuredProduct.map((e) {
                      return ProductItemWidget(productItem: e);
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          //navbar
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: Container(
                color: pureWhite,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: redVelvet,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Added",
                                style: GoogleFonts.dmSans(
                                  color: pureWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(
                                IconlyBold.heart,
                                color: pureWhite,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(19),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: blueOcean,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Add To Cart",
                                style: GoogleFonts.dmSans(
                                  color: pureWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LineGap extends StatelessWidget {
  const LineGap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 25,
      ),
      child: Container(
        color: softGrey,
        height: 1,
      ),
    );
  }
}
