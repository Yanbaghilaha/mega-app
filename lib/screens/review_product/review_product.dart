// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/datas/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import 'package:e_commerce/screens/extract/my_app_bar.dart';
import 'package:e_commerce/theme/colors.dart';

class ReviewProduct extends StatelessWidget {
  const ReviewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Review Product",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Reviews
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: Row(
                children: [
                  //Number
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "4.7",
                            style: GoogleFonts.dmSans(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 3,
                            ),
                          ),
                          Text(
                            "/5",
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3,
                            ),
                          ),
                        ],
                      ),
                      const Gap(5),
                      Text(
                        "86 Reviews",
                        style: GoogleFonts.dmSans(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),

                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 10, 0),
                    width: 1,
                    height: 106,
                    color: softGrey,
                  ),

                  const Gap(10),
                  //Star
                  const SizedBox(height: 20),

                  Column(
                    children: List.generate(
                      5,
                      (rowIndex) => Column(
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) {
                                int starValue = 5 - index;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: starValue <= rowIndex
                                      ? Icon(
                                          IconlyLight.star,
                                          color: halfGrey,
                                          size: 14,
                                        )
                                      : Icon(
                                          IconlyBold.star,
                                          color: orangeFresh,
                                          size: 14,
                                        ),
                                );
                              },
                            ),
                          ),
                          const Gap(5)
                        ],
                      ),
                    ),
                  ),

                  const Gap(8),

                  const Expanded(
                    child: Column(
                      children: [
                        ProgressRatingBar(
                          valueBar: 1,
                          valueText: "12",
                        ),
                        Gap(3),
                        ProgressRatingBar(
                          valueBar: .8,
                          valueText: "8",
                        ),
                        Gap(3),
                        ProgressRatingBar(
                          valueBar: .5,
                          valueText: "5",
                        ),
                        Gap(3),
                        ProgressRatingBar(
                          valueBar: .2,
                          valueText: "2",
                        ),
                        Gap(3),
                        ProgressRatingBar(
                          valueBar: .1,
                          valueText: "1",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          padding:
                                              const EdgeInsets.only(right: 2),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressRatingBar extends StatelessWidget {
  const ProgressRatingBar({
    Key? key,
    required this.valueText,
    required this.valueBar,
  }) : super(key: key);
  final String valueText;
  final double valueBar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            backgroundColor: softGrey,
            borderRadius: BorderRadius.circular(10),
            minHeight: 4,
            value: valueBar,
            valueColor: AlwaysStoppedAnimation(orangeFresh),
          ),
        ),
        const Gap(10),
        Text(
          valueText.toString(),
          style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            letterSpacing: 0.2,
            color: navyBlack,
          ),
        ),
      ],
    );
  }
}
