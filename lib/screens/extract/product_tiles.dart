// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:e_commerce/models/featured_product.dart';
import 'package:e_commerce/theme/colors.dart';

class CurrencyIDR {
  static String convertToIdr(dynamic number, int decimalNumber) {
    NumberFormat currencyFormatted = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalNumber,
    );
    return currencyFormatted.format(number);
  }
}

class ProductItemWidget extends StatelessWidget {
  final Product productItem;
  final bool sale;
  const ProductItemWidget({
    Key? key,
    required this.productItem,
    this.sale = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 156,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 1),
          ),
        ],
        color: navyBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset("assets/products/${productItem.image}.png"),
              Align(
                alignment: Alignment.bottomLeft,
                child: sale
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: redVelvet,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "SALE",
                          style: GoogleFonts.dmSans(
                            color: pureWhite,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    : Container(
                        child: null,
                      ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productItem.nameProduct,
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                  color: navyBlack,
                ),
              ),

              //Price
              Text(
                CurrencyIDR.convertToIdr(productItem.price, 0),
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
                        productItem.rating.toString(),
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
                        "${productItem.review.toInt()} Reviews",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  )

                  //dots Icon
                  ,
                  SvgPicture.asset("assets/icons/menu-dots-vertical.svg")
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
