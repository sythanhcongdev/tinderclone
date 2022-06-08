import 'package:flutter/material.dart';
import 'package:tinderclone/data/icons.dart';
import 'package:tinderclone/theme/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

import '../data/explore_json.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List itemsTemp = [];
  int itemLength = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      itemsTemp = explore_json;
      itemLength = explore_json.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
            height: size.height * 0.74,
            child: TinderSwapCard(
              totalNum: itemLength,
              maxWidth: size.width,
              maxHeight: size.height,
              minWidth: size.width * 0.7,
              minHeight: size.height * 0.5,
              cardBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(itemsTemp[index]['img']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: size.height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                black.withOpacity(0.25),
                                black.withOpacity(0),
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.72,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                itemsTemp[index]['name'],
                                                style: const TextStyle(
                                                    fontSize: 24,
                                                    color: white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                itemsTemp[index]['age'],
                                                style: const TextStyle(
                                                  fontSize: 22,
                                                  color: white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: const BoxDecoration(
                                                  color: green,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "Recently Active",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: List.generate(
                                                itemsTemp[index]['likes']
                                                    .length, (indexLikes) {
                                              if (indexLikes == 0) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: white,
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: white
                                                            .withOpacity(0.4)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3,
                                                              bottom: 3,
                                                              left: 10,
                                                              right: 10),
                                                      child: Text(
                                                        itemsTemp[index]
                                                                ['likes']
                                                            [indexLikes],
                                                        style: TextStyle(
                                                            color: white),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: white
                                                          .withOpacity(0.2)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 3,
                                                            bottom: 3,
                                                            left: 10,
                                                            right: 10),
                                                    child: Text(
                                                      itemsTemp[index]['likes']
                                                          [indexLikes],
                                                      style: TextStyle(
                                                          color: white),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: size.width * 0.2,
                                        child: const Center(
                                          child: Icon(
                                            Icons.info,
                                            color: white,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            )),
        SizedBox(height: 10),
        getFooter(),
        SizedBox(height: 10),
      ],
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            item_icons.length,
            (index) {
              return Container(
                width: item_icons[index]['size'],
                height: item_icons[index]['size'],
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 10),
                    ]),
                child: Center(
                  child: SvgPicture.asset(
                    item_icons[index]['icon'],
                    width: item_icons[index]['icon_size'],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
