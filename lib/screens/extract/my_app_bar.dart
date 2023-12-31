// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import 'package:e_commerce/theme/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String title;
  final String? leftIcon;
  final bool hasLeftIcon;

  const MyAppBar({
    Key? key,
    this.leftIcon = "",
    this.hasLeftIcon = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: pureWhite,
      elevation: 0,
      toolbarHeight: 99,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            hasLeftIcon
                ? Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(IconlyLight.arrow_left_2, color: navyBlack),
                      ),
                      const Gap(20),
                      const Icon(null),
                    ],
                  )
                : GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(IconlyLight.arrow_left_2, color: navyBlack),
                  ),
            Text(
              title,
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: navyBlack,
              ),
            ),
            hasLeftIcon
                ? Row(
                    children: [
                      SvgPicture.asset(
                        leftIcon.toString(),
                      ),
                      const Gap(20),
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          SvgPicture.asset("assets/icons/shoping-cart.svg"),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: redVelvet,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Stack(
                    alignment: Alignment.topRight,
                    children: [
                      SvgPicture.asset("assets/icons/shoping-cart.svg"),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: redVelvet,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
