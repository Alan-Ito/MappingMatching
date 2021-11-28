import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final Sink<int> viewCtrl;

  Footer({Key? key, required this.viewCtrl}) : super(key: key); //sinkの受け取り

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<Footer> {
  int pageIndex = 1; //ページのインデックス

  navigationItem() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.place),
        label: 'Mapping',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.find_in_page),
        label: 'Matching',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'You',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: pageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (_pageIndex) {
        pageIndex = _pageIndex;
        widget.viewCtrl.add(_pageIndex); //sinkにインデックスを流す
      },
      items: navigationItem(), //リファクタリングで外に出す
    );
  }
}