import 'package:flutter/material.dart';
import 'package:mappingmatching/pages/mapping.dart';
import 'package:mappingmatching/pages/matching.dart';
import 'package:mappingmatching/pages/searching.dart';
import 'package:mappingmatching/pages/userpage.dart';


class View extends StatefulWidget {
  final Stream<int> viewCtrl;

  View({Key? key, required  this.viewCtrl}) : super(key: key);
  _View createState() => _View();
}

class _View extends State<View> {
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 1); // 最初に表示するインデックス
    listenPage();
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageController,
        children: [MappingPage(), MatchingPage(), SearchingPage(), UserPage()], //<-表示したいページ
    );
  }

  // footerでボタンが押されたらインデックスが流れてくる
  listenPage() {
    widget.viewCtrl.listen((event) { // <- listenする
      _pageController!.animateToPage(event,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }
}