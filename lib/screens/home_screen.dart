import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_animation/tabs/chat_tab.dart';
import 'package:lottie_animation/tabs/feed_tab.dart';
import 'package:lottie_animation/tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController _animationController1;
  AnimationController _animationController2;
  AnimationController _animationController3;
  AnimationController _animationController4;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _animationController1 = AnimationController(vsync: this);
    _animationController2 = AnimationController(vsync: this);
    _animationController3 = AnimationController(vsync: this);
    _animationController4 = AnimationController(vsync: this);
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _tabView(),
            _tabBar(),
          ],
        ),
      ),
    );
  }

  Widget _tabView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ProfileTab(),
          ChatTab(),
          FeedTab(),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      height: 80.0,
      color: Colors.white,
      child: TabBar(
        indicatorColor: Colors.transparent,
        controller: _tabController,
        onTap: (index) => _handleOnTap(index),
        tabs: <Widget>[
          _tabItem(
              "assets/lottie/profile_tab.json", _animationController1, 40.0),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: _tabItem(
                "assets/lottie/chat_tab.json", _animationController2, 70.0),
          ),
          _tabItem(
              "assets/lottie/notification.json", _animationController3, 60.0),
        ],
      ),
    );
  }

  Widget _tabItem(String _asset, AnimationController _c, double _width) {
    return Lottie.asset(
      _asset,
      controller: _c,
      onLoaded: (composition) {
        _c
          ..duration = composition.duration
          ..forward();
      },
      width: _width,
      height: _width,
      fit: BoxFit.contain,
    );
  }

  void _handleOnTap(int index) {
    // start animation on tapping tab bar item
    switch (index) {
      case 0:
        _animationController1.repeat().timeout(Duration(seconds: 1),
            onTimeout: () {
          _animationController1.forward(from: 1);
          _animationController1.stop();
        });
        break;
      case 1:
        _animationController2.repeat().timeout(Duration(seconds: 1),
            onTimeout: () {
          _animationController2.forward(from: 1);
          _animationController2.stop();
        });
        break;
      case 2:
        _animationController3.repeat().timeout(Duration(seconds: 1),
            onTimeout: () {
          _animationController3.forward(from: 1);
          _animationController3.stop();
        });
        break;
      case 3:
        _animationController4.repeat().timeout(Duration(seconds: 1),
            onTimeout: () {
          _animationController4.forward(from: 1);
          _animationController4.stop();
        });
        break;
    }
  }
}
