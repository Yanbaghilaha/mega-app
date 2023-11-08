import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Popover extends StatelessWidget {
  final Widget content;
  final String title;
  const Popover({
    super.key,
    required this.content,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: pureWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Wrap(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: softGrey),
                  ),
                ),
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        PhosphorIcons.x,
                        size: 24,
                      ),
                    )
                  ],
                ),
              ),

              //Item Shipping
              content,
            ],
          ),
        ],
      ),
    );
  }
}
