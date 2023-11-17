// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:e_commerce/theme/colors.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final bool isSeeAll;
  final VoidCallback? onTap;
  const TitleBar({
    Key? key,
    required this.title,
    this.isSeeAll = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: navyBlack,
                  letterSpacing: 0.061),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                isSeeAll ? "See All" : "",
                style: GoogleFonts.dmSans(
                  letterSpacing: 0.048,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: blueOcean,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
