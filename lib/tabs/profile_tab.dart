import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  List<String> _myAssets = [
    "assets/lottie/love_emo.json",
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
    "assets/lottie/notification.json",
    "assets/lottie/person_chatting.json",
    "assets/lottie/post_tab.json",
    "assets/lottie/sad_emo.json",
    "assets/lottie/send_btn.json",
    "assets/lottie/shock_emo.json",
    "assets/lottie/wink_emo.json",
    "assets/lottie/wink_emo2.json",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _myAssets.length,
      itemBuilder: (context, index) {
        return _pageItem(_myAssets[index]);
      },
    ));
  }

  Widget _pageItem(String _asset) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Lottie.asset(
            _asset,
          ),
        ),
        Text("Swipe Up Please"),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
