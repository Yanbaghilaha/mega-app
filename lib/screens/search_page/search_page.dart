import 'package:e_commerce/datas/product.dart';
import 'package:e_commerce/screens/extract/product_tiles.dart';
import 'package:e_commerce/screens/extract/search_bar.dart';
import 'package:e_commerce/screens/extract/title_bar.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

List lastSearched = [
  'TMA2 Wireless',
  'Cable',
  'Macbook',
];

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pureWhite,
        automaticallyImplyLeading: false,
        elevation: 0,
        iconTheme: IconThemeData(
          color: navyBlack,
        ),
        toolbarHeight: 99,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  IconlyLight.arrow_left_2,
                ),
              ),
              Text(
                "Search",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w500,
                  color: navyBlack,
                  fontSize: 16,
                ),
              ),
              const Icon(null),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                const SearchBarWidget(),
                //Last Searched
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Title
                      Text(
                        "Terakhir Dicari",
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: navyBlack,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //List Last Searched
                      ListView.separated(
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Cock And List
                              Row(
                                children: [
                                  Icon(
                                    IconlyLight.time_circle,
                                    color: halfGrey,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(lastSearched[index])
                                ],
                              ),
                              const Icon(
                                PhosphorIcons.x,
                                size: 20,
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 25,
                        ),
                        itemCount: lastSearched.length,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //Feature Product
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 35),
            child: Column(
              children: [
                const TitleBar(
                  title: "Featured Product",
                ),
                const SizedBox(
                    height: 20), // Berikan jarak antara judul dan produk
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: featuredProduct.map((e) {
                      return ProductItemWidget(productItem: e);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
