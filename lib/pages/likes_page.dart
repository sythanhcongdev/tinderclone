import 'package:flutter/material.dart';
import 'package:tinderclone/data/icons.dart';
import 'package:tinderclone/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

import '../data/explore_json.dart';
import '../data/likes_json.dart';

class LikesPage extends StatefulWidget {
  const LikesPage({Key? key}) : super(key: key);

  @override
  State<LikesPage> createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      padding: const EdgeInsets.only(bottom: 110),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "10 Likes",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: primary),
              ),
              Container(
                height: 25,
                width: 1,
                decoration: BoxDecoration(color: black.withOpacity(0.15)),
              ),
              Text(
                "Top Picks",
                style: TextStyle(
                  color: black.withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 0.8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: List.generate(likes_json.length, (index) {
              return SizedBox(
                width: (size.width - 15) / 2,
                height: 250,
                child: Stack(
                  children: [
                    Container(
                      width: (size.width - 15) / 2,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(likes_json[index]['img']),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      width: (size.width - 15) / 2,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            black.withOpacity(0.25),
                            black.withOpacity(0)
                          ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          likes_json[index]['active']
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                            color: green,
                                            shape: BoxShape.circle),
                                      ),
                                      const SizedBox(width: 5),
                                      const Text("Recently Active",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: white,
                                          ))
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                            color: grey,
                                            shape: BoxShape.circle),
                                      ),
                                      const SizedBox(width: 5),
                                      const Text("Offline",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: white,
                                          ))
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
       
      ],
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 90,
      child: Column(
        children: [
          Container(
            width: size.width - 70,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                yellow_one,
                yellow_two,
              ]),
            ),
            child: const Center(
                child: Text(
              "SEE WHO LIKES YOU",
              style: TextStyle(
                  fontSize: 18, color: white, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
