import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FeedTab extends StatefulWidget {
  @override
  _FeedTabState createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Lottie.asset("assets/lottie/share_fb.json", height: 50.0),
        SizedBox(
          height: 10.0,
        ),
        Lottie.asset("assets/lottie/share_insta.json", height: 50.0),
        SizedBox(
          height: 10.0,
        ),
        Lottie.asset("assets/lottie/share_messenget.json", height: 50.0),
        SizedBox(
          height: 60.0,
        ),
      ],
    );
  }
}
