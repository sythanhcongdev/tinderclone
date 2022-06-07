import 'package:flutter/material.dart';
import 'package:tinderclone/data/icons.dart';
import 'package:tinderclone/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

import '../data/explore_json.dart';
import '../data/chats_json.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Messages",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: primary),
              ),
              Container(
                height: 25,
                width: 1,
                decoration: BoxDecoration(color: black.withOpacity(0.15)),
              ),
              Text(
                "Matches",
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
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                color: grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              cursorColor: black.withOpacity(0.5),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: black.withOpacity(0.5),
                ),
                hintText: "Search",
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "New Matches",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: primary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: List.generate(chats_json.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Stack(
                              children: [
                                chats_json[index]['story']
                                    ? Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: primary,
                                            width: 3,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    chats_json[index]['img']),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                chats_json[index]['img']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                Positioned(
                                  top: 48,
                                  left: 48,
                                  child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: green,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: white,
                                          width: 3,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 70,
                            child: Align(
                              child: Text(chats_json[index]['name'],
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Column(
                children: List.generate(userMessages.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: [
                              userMessages[index]['story']
                                  ? Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: primary,
                                          width: 3,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  userMessages[index]['img']),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              userMessages[index]['img']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                              Positioned(
                                top: 48,
                                left: 48,
                                child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: white,
                                        width: 3,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userMessages[index]['name'],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: size.width - 135,
                              child: Text(
                                userMessages[index]['message'] +
                                    " - " +
                                    userMessages[index]['created_at'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: black.withOpacity(0.7),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
