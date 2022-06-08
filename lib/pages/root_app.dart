import 'package:flutter/material.dart';
import 'package:tinderclone/pages/account_page.dart';
import 'package:tinderclone/pages/chat_page.dart';
import 'package:tinderclone/pages/likes_page.dart';
import '../data/chats_json.dart';
import '../theme/colors.dart';
import 'package:flutter_svg/svg.dart';

import 'explore_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: getAppBar(),
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }

  IndexedStack getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        ExplorePage(),
        LikesPage(),
        ChatPage(),
        ChatPage(),
        AccountPage(),
      ],
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Image.asset('assets/images/logo_slove_black.png', height: 140),
      leading: Padding(
        padding: const EdgeInsets.only(top: 5, left: 20),
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(userMessages[0]['img']),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;

    List bottomItems = [
      pageIndex == 0
          ? "assets/images/explore_active_icon.svg"
          : "assets/images/explore_icon.svg",
      pageIndex == 1
          ? "assets/images/likes_active_icon.svg"
          : "assets/images/likes_icon.svg",
      pageIndex == 2
          ? "assets/images/chat_active_icon.svg"
          : "assets/images/chat_icon.svg",
      pageIndex == 3
          ? "assets/images/chat_active_icon.svg"
          : "assets/images/chat_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return SizedBox(
      width: size.width,
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = index;
                });
              },
              icon: SvgPicture.asset(
                bottomItems[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}
