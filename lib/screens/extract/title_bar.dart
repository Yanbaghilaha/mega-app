import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final bool isSeeAll;
  const TitleBar({
    super.key,
    required this.title,
    this.isSeeAll = true,
  });

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
            Text(
              isSeeAll ? "See All" : "",
              style: GoogleFonts.dmSans(
                letterSpacing: 0.048,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: blueOcean,
              ),
            ),
          ],
        )
      ],
    );
  }
}
