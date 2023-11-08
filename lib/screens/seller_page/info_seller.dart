import 'package:e_commerce/datas/details_product.dart';
import 'package:e_commerce/models/featured_product.dart';
import 'package:e_commerce/screens/details_page/details_product.dart';
import 'package:e_commerce/screens/extract/my_app_bar.dart';
import 'package:e_commerce/screens/extract/pop_over.dart';
import 'package:e_commerce/screens/extract/product_tiles.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class InfoSeller extends StatefulWidget {
  final String product;
  const InfoSeller({super.key, required this.product});

  @override
  State<InfoSeller> createState() => _InfoSellerState();
}

class DetailsSeller {
  final String title;
  final String item;

  DetailsSeller({
    required this.title,
    required this.item,
  });
}

List<DetailsSeller> detailsSeller = [
  DetailsSeller(
    title: "Pengikut",
    item: "23 Rb",
  ),
  DetailsSeller(
    title: "Produk",
    item: "150 Item",
  ),
  DetailsSeller(
    title: "Bergabung",
    item: "20 Okt 2023",
  ),
];

class _InfoSellerState extends State<InfoSeller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Info Seller",
        hasLeftIcon: true,
        leftIcon: "assets/icons/search.svg",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Shop Name
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: Row(
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
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shop Larson Electronic",
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                              ),
                            ),
                            Text(
                              "Official Store",
                              style: GoogleFonts.dmSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                letterSpacing: .2,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/star-filled.svg"),
                            const Gap(3),
                            Text(
                              widget.product.toString(),
                              style: GoogleFonts.dmSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Open House Clock
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 21, 25, 0),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/marker-time.svg"),
                  const Gap(10),
                  Text(
                    "Jawa Barat, Bandung (Jam Buka 08:00-21:00)",
                    style: GoogleFonts.dmSans(
                      color: navyBlack,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            const Gap(23),

            //Info Seller
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...detailsSeller.map(
                    (e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: GoogleFonts.dmSans(
                            color: darkGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Gap(10),
                        Text(
                          e.item,
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: navyBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const LineGap(),

            //Dukungan Pengiriman
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  builder: (context) {
                    return Popover(
                      title: "Dukungan Pengiriman",
                      content: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(25, 20, 20, 0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Image.asset(
                                      "assets/courier/${courier[index].image}.png"),
                                ),
                                const Gap(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      courier[index].title,
                                      style: GoogleFonts.dmSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Gap(10),
                                    Text(
                                      courier[index].description,
                                      style: GoogleFonts.dmSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: darkGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const LineGap();
                        },
                        itemCount: courier.length,
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dukungan Pengiriman",
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: navyBlack,
                      ),
                    ),
                    Icon(
                      IconlyLight.arrow_right_2,
                      size: 20,
                      color: darkGrey,
                    ),
                  ],
                ),
              ),
            ),

            //Item Card Product
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                  left: 25, right: 25, bottom: 120, top: 46),
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
                  onTap: () {},
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
    );
  }
}

class Courier {
  final String image, title, description;
  Courier({
    required this.title,
    required this.image,
    required this.description,
  });
}

List<Courier> courier = [
  Courier(title: "J&T", image: "j&t", description: "Reguler, Express"),
  Courier(title: "JNE", image: "jne", description: "REG, YES"),
];
