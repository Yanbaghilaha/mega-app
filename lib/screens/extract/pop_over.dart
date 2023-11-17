// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/screens/extract/line_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:e_commerce/theme/colors.dart';
import 'package:iconly/iconly.dart';

class FilterSortir {
  final String title;
  final bool isHaveLine;

  FilterSortir({
    required this.title,
    this.isHaveLine = false,
  });
}

List<FilterSortir> filterSortier = [
  FilterSortir(title: "Filter", isHaveLine: true),
  FilterSortir(title: "Sortir", isHaveLine: false),
];

class Popover extends StatefulWidget {
  final Widget content;
  final bool isUsingTabBar;
  final String title;
  final bool isHaveAdditionText;
  const Popover({
    Key? key,
    required this.content,
    this.isUsingTabBar = false,
    required this.title,
    this.isHaveAdditionText = false,
  }) : super(key: key);

  @override
  State<Popover> createState() => _PopoverState();
}

class Filter {
  final String title;
  bool isSelected;

  Filter({
    required this.title,
    this.isSelected = false,
  });
}

class SortirList {
  final String title;
  bool isActive;

  SortirList({required this.title, this.isActive = false});
}

List<Filter> filter = [
  Filter(title: "Semua Sub Kategory", isSelected: false),
  Filter(title: "Handphone", isSelected: false),
  Filter(title: "Computer", isSelected: false),
  Filter(title: "Laptop", isSelected: false)
];

List<SortirList> sortir = [
  SortirList(title: "Name (A-Z)", isActive: true),
  SortirList(title: "Name (Z-A)", isActive: false),
  SortirList(title: "Price (High - Low)", isActive: false),
  SortirList(title: "Price (Low - High)", isActive: false),
];

void setActiveItem(int index) {
  for (int i = 0; i < sortir.length; i++) {
    sortir[i].isActive = (i == index);
  }
}

class _PopoverState extends State<Popover> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    RangeValues currentRangeValues = const RangeValues(10, 30);

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
                padding: EdgeInsets.fromLTRB(
                    25, 25, 25, widget.isHaveAdditionText ? 0 : 25),
                child: Column(
                  children: [
                    widget.isHaveAdditionText
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.title,
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
                              const Gap(20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TabBar(
                                  tabAlignment: TabAlignment.start,
                                  controller: tabController,
                                  indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(
                                      width: 3,
                                      color: blueOcean,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelPadding:
                                      const EdgeInsets.only(right: 20),
                                  labelColor: blueOcean,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  isScrollable: true,
                                  tabs: [
                                    Tab(
                                      height: 30,
                                      child: Text(
                                        "Filter",
                                        style: TextStyle(color: navyBlack),
                                      ),
                                    ),
                                    Tab(
                                      height: 30,
                                      child: Text(
                                        "Sortir",
                                        style: TextStyle(color: navyBlack),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )

                        //If False
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.title,
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
                  ],
                ),
              ),

              const Gap(20),
              //Item Shipping

              SizedBox(
                height: 334 + 60,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Range Harga",
                            style: GoogleFonts.dmSans(
                              color: navyBlack,
                              fontSize: 14,
                            ),
                          ),
                          const Gap(20),
                          //Slider
                          StatefulBuilder(
                            builder: (context, setState) {
                              return Column(
                                children: [
                                  SliderTheme(
                                    data: const SliderThemeData(
                                      rangeThumbShape:
                                          RoundRangeSliderThumbShape(
                                              elevation: 0),
                                      overlayShape: RoundSliderOverlayShape(
                                          overlayRadius: 0),
                                    ),
                                    child: RangeSlider(
                                      min: 10,
                                      max: 100000,
                                      divisions: 10000,
                                      values: currentRangeValues,
                                      onChanged: (RangeValues values) {
                                        setState(() {
                                          currentRangeValues = values;
                                        });
                                      },
                                    ),
                                  ),

                                  const Gap(10),
                                  //Range Harga
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Rp ${currentRangeValues.start.round().toString()}",
                                        style: GoogleFonts.dmSans(
                                            color: navyBlack,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "Rp ${currentRangeValues.end.round().toString()}",
                                        style: GoogleFonts.dmSans(
                                            color: navyBlack,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                          const Gap(20),

                          //Line Gap
                          Container(
                            width: double.maxFinite,
                            height: 1,
                            color: softGrey,
                          ),

                          //List Content
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    filter[index].title.toString(),
                                    style: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: navyBlack,
                                    ),
                                  ),
                                  StatefulBuilder(builder: (context, setState) {
                                    return Checkbox(
                                      value: filter[index].isSelected,
                                      onChanged: (value) {},
                                    );
                                  })
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  color: softGrey,
                                  height: 1,
                                ),
                              );
                            },
                            itemCount: filter.length,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = sortir[index];
                          return StatefulBuilder(builder: (context, setState) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  setActiveItem(index);
                                });
                              },
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      sortir[index].title,
                                      style: GoogleFonts.dmSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  if (item.isActive)
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: SvgPicture.asset(
                                        "assets/icons/check.svg",
                                        width: 20,
                                      ),
                                    ),
                                ],
                              ),
                            );
                          });
                        },
                        separatorBuilder: (context, index) => const LineGap(),
                        itemCount: sortir.length,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Center(
                            child: Text(
                          "Reset",
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: blueOcean,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            "Reset",
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: pureWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
