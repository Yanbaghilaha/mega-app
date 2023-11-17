import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';

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
