import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChatTab extends StatefulWidget {
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  List<String> _myAssets = [
    "assets/lottie/bot.json",
    "assets/lottie/fire.json",
    "assets/lottie/flame.json",
    "assets/lottie/flower_emo.json",
    "assets/lottie/funny_emo.json",
    "assets/lottie/heart_emo.json",
    "assets/lottie/heart_emo2.json",
    "assets/lottie/heart_emo3.json",
    "assets/lottie/heart_tab.json",
    "assets/lottie/like_emo.json",
    "assets/lottie/loader.json",
    "assets/lottie/love_emo.json",
    "assets/lottie/notification.json",
    "assets/lottie/person_chatting.json",
    "assets/lottie/post_tab.json",
    "assets/lottie/sad_emo.json",
    "assets/lottie/send_btn.json",
    "assets/lottie/shock_emo.json",
    "assets/lottie/wink_emo.json",
    "assets/lottie/wink_emo2.json",
  ];

  List<String> _newAsset = [];

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _isLoading ? _loadingWidget() : _chatConvo(),
        ],
      ),
    );
  }

  Widget _loadingWidget() {
    return Column(
      children: <Widget>[
        Lottie.asset("assets/lottie/person_chatting.json"),
        SizedBox(
          height: 20.0,
        ),
        Text("Loading your chats..."),
      ],
    );
  }

  Widget _chatConvo() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (context, index) {
                if (index.isEven) {
                  return _chatItem(_newAsset[index], Alignment.centerRight);
                } else {
                  return _chatItem(_newAsset[index], Alignment.centerLeft);
                }
              },
              itemCount: _newAsset.length,
            ),
          ),
          _inputSection(),
        ],
      ),
    );
  }

  Widget _chatItem(String _asset, Alignment _align) {
    return Align(
      alignment: _align,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Lottie.asset(
          _asset,
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,
        ),
      ),
    );
  }

  Widget _inputSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type a message...",
                  contentPadding: const EdgeInsets.only(left: 20.0),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final _rand = Random();
              setState(() {
                _newAsset.insert(0, _myAssets[_rand.nextInt(19)]);
              });
            },
          ),
        ],
      ),
    );
  }
}
