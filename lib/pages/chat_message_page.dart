import 'package:flutter/material.dart';
import 'package:tinderclone/data/chatMes.dart';

import '../data/chats_json.dart';
import '../data/likes_json.dart';
import '../theme/colors.dart';

class MesagesScreen extends StatefulWidget {
  const MesagesScreen({Key? key}) : super(key: key);

  @override
  State<MesagesScreen> createState() => _MesagesScreenState();
}

class _MesagesScreenState extends State<MesagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage(chats_json[0]['img']),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chats_json[0]['name'],
                style: const TextStyle(fontSize: 16),
              ),
              const Text(
                'Active 3m ago',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.local_phone),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.videocam),
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  Widget getBody() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) => Message(
                message: demeChatMessages[index],
              ),
            ),
          ),
        ),
        getChatInputField(),
      ],
    );
  }

  Widget getChatInputField() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: white.withOpacity(0.8), boxShadow: [
          BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 32,
              color: grey.withOpacity(0.1))
        ]),
        child: SafeArea(
          child: Row(children: [
            Icon(
              Icons.mic,
              color: primary.withOpacity(0.3),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        color: grey.withOpacity(0.7),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Type message',
                              border: InputBorder.none),
                        ),
                      ),
                      Icon(
                        Icons.attach_file,
                        color: grey.withOpacity(0.7),
                      ),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: grey.withOpacity(0.7),
                      ),
                      const SizedBox(width: 10),
                    ],
                  )),
            )
          ]),
        ),
      ),
    ]);
  }
}

class Message extends StatelessWidget {
  const Message({Key? key, required this.message}) : super(key: key);
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        case ChatMessageType.audio:
          return AudioMessage(message: message);
        case ChatMessageType.video:
          return VideoMessage();
        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage(chats_json[0]['img']),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
          messageContaint(message),
          if (message.isSender) MessageStatusDot(status: message.messageStatus),
        ],
      ),
    );
  }
}

class VideoMessage extends StatelessWidget {
  const VideoMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: AspectRatio(
          aspectRatio: 1.6,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset("assets/images/Video Place Here.png"),
              ),
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: white.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    size: 18,
                    color: white,
                  )),
            ],
          )),
    );
  }
}

class AudioMessage extends StatelessWidget {
  final ChatMessage message;

  const AudioMessage({Key? key, required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: primary.withOpacity(message.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: primary.withOpacity(message.isSender ? 1 : 0.4),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: primary.withOpacity(message.isSender ? 1 : 0.4),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration:
                          BoxDecoration(color: primary, shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text('0.37',
              style: TextStyle(
                fontSize: 12,
                color: primary.withOpacity(message.isSender ? 1 : 0.4),
              ))
        ],
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: primary.withOpacity(message.isSender ? 1 : 0.1),
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        message.text,
        style:
            TextStyle(color: message.isSender ? white : black.withOpacity(0.4)),
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  const MessageStatusDot({Key? key, required this.status}) : super(key: key);
  final MessageStatus status;
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return primary.withOpacity(0.5);
        case MessageStatus.not_view:
          return grey;
        case MessageStatus.viewed:
          return primary;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: 12),
      height: 12,
      width: 12,
      decoration:
          BoxDecoration(color: dotColor(status), shape: BoxShape.circle),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: white,
      ),
    );
  }
}
