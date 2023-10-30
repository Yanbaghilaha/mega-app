// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/datas/banner.dart';
import 'package:e_commerce/datas/bottom_navigation/bottom_navigation.dart';
import 'package:e_commerce/datas/categories.dart';
import 'package:e_commerce/datas/latest_news.dart';
import 'package:e_commerce/datas/product.dart';
import 'package:e_commerce/models/latest_news.dart';
import 'package:e_commerce/screens/details_page/details_page.dart';
import 'package:e_commerce/screens/extract/product_tiles.dart';
import 'package:e_commerce/screens/extract/search_bar.dart';
import 'package:e_commerce/screens/extract/title_bar.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  void onTap(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pureWhite,
        elevation: 0,
        toolbarHeight: 99,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(null),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(null),
                ],
              ),
              Text(
                "Mega Mall",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  color: blueOcean,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/bell.svg"),
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset("assets/icons/shoping-cart.svg"),
                ],
              ),
            ],
          ),
        ),
      ),

      //bottombar
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: navyBlack,
        selectedItemColor: blueOcean,
        unselectedLabelStyle: GoogleFonts.dmSans(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        selectedLabelStyle: GoogleFonts.dmSans(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        iconSize: 24,
        currentIndex: currentIndex,
        items: bottomNavigation.map((e) {
          return BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: e.icon,
            ),
            label: e.text,
          );
        }).toList(),
      ),
      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Search Bar
            const SearchBarWidget(),

            const SizedBox(
              height: 30,
            ),

            //Banner
            CarouselSlider.builder(
              itemCount: bannerAds.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.only(left: 25),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      //Right Image
                      Align(
                        alignment: Alignment.centerRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                              "assets/banner/${bannerAds[index].image}.png"),
                        ),
                      ),
                      //Left Content
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(100),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(100),
                              ),
                              color: blueOcean),
                          child: Stack(
                            children: [
                              Container(
                                width: 190,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 34, horizontal: 21),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      bannerAds[index].title,
                                      style: GoogleFonts.dmSans(
                                        color: pureWhite,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                      bannerAds[index].subTitle,
                                      style: GoogleFonts.dmSans(
                                        color: pureWhite,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                  height: 150,
                  enableInfiniteScroll: false,
                  // viewportFraction: 1,
                  padEnds: false,
                  disableCenter: true),
            ),

            //Categories
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 30, 25, 16),
              child: TitleBar(
                title: "Categories",
              ),
            ),

            //menu scroll horizontal
            SizedBox(
              height: 74,
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 25, right: 25),
                separatorBuilder: (context, index) {
                  return Container(
                    width: 32,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(title: categoriesMenu[index].title),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: categoriesMenu[index].color),
                          child: SvgPicture.asset(
                              "assets/categories_icons/${categoriesMenu[index].icon}.svg"),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          categoriesMenu[index].title,
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            letterSpacing: 0.028,
                            fontWeight: FontWeight.w400,
                            color: navyBlack,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: categoriesMenu.length,
              ),
            ),

            //Featured Product
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: TitleBar(
                title: "Featured Product",
              ),
            ),

            //content Featured Product
            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 25, top: 24),
              child: Row(
                children: featuredProduct.map((e) {
                  return ProductItemWidget(productItem: e);
                }).toList(),
              ),
            ),

            //Green Baner
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff0ACF83),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Content
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "C02 - Cable\nMultifuntion",
                          style: GoogleFonts.dmSans(
                            color: pureWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            letterSpacing: 0.2,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Shop Now",
                              style: GoogleFonts.dmSans(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            SvgPicture.asset(
                              "assets/icons/arrow-right.svg",
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),

                    SimpleShadow(
                      opacity: 0.5, // Default: 0.5
                      color: Colors.black, // Default: Black
                      offset: const Offset(20, 10), // Default: Offset(2, 2)
                      sigma: 30,
                      child: Image.asset(
                        "assets/products/cable.png",
                        height: 170,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: TitleBar(title: "Best Seller"),
            ),

            //Best Seller
            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 25, top: 24),
              child: Row(
                children: bestSeller.map((e) {
                  return ProductItemWidget(productItem: e);
                }).toList(),
              ),
            ),

            //Blue Banner
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blueOcean,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Content
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Modular\nHeadphone",
                          style: GoogleFonts.dmSans(
                            color: pureWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            letterSpacing: 0.2,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Shop Now",
                              style: GoogleFonts.dmSans(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            SvgPicture.asset(
                              "assets/icons/arrow-right.svg",
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),

                    SimpleShadow(
                      opacity: 0.5, // Default: 0.5
                      color: Colors.black, // Default: Black
                      offset: const Offset(20, 10), // Default: Offset(2, 2)
                      sigma: 30,
                      child: Image.asset(
                        "assets/products/headphone.png",
                        height: 170,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //New Arrivals
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 24),
              child: TitleBar(title: "New Arrivals"),
            ),

            //Content New Arrivals
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: newArrivals.map((e) {
                  return ProductItemWidget(
                    productItem: e,
                  );
                }).toList(),
              ),
            ),

            //Top Rated Product
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 30, 25, 24),
              child: TitleBar(title: "Top Rated Product"),
            ),

            //Content Top Rated
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 25),
              clipBehavior: Clip.none,
              child: Row(
                children: topRatedProduct.map((e) {
                  return ProductItemWidget(
                    productItem: e,
                    sale: true,
                  );
                }).toList(),
              ),
            ),

            //Lates News
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 55, 25, 24),
              child: TitleBar(title: "Latest News", isSeeAll: false),
            ),

            //content Latest New
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 30),
              itemBuilder: (context, index) {
                LatestNews news = latestNews[index];
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            maxLines: 2,
                            news.title,
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              color: navyBlack,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            news.subtitle,
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: navyBlack,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            news.dateTime.toString(),
                            style: GoogleFonts.dmSans(
                              color: darkGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/${news.image}.png",
                      width: 80,
                    )
                  ],
                );

                //Image
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: softGrey,
                  thickness: 1,
                  height: 40,
                );
              },
              itemCount: latestNews.length,
            ),

            //Button See All
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextButton(
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
                        "See All News",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: navyBlack,
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
