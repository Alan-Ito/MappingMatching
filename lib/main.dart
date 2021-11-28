import 'package:flutter/material.dart';
import 'package:mappingmatching/views/view.dart';

import './header.dart';
import './footer.dart';

import './bloc/view-ctrl-bloc.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget { // statelessからstatefulに変更
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() =>_MyApp(); //MyAppクラスのState
//Widget build(BuildContext context) {
//return MaterialApp(
//title: 'Flutter Demo',
//theme: ThemeData(
//primarySwatch: Colors.yellow,
//),
//home: const MyHomePage(title: 'MappingMatching'),
//);
//}
}

class _MyApp extends State<MyApp> {
  ViewCtrlBloc? viewCtrl;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: Header(),
          body: View(viewCtrl: viewCtrl!.viewStream), // 受け取るためにstreamを渡す
          bottomNavigationBar: Footer(viewCtrl: viewCtrl!.viewSink), // インデックスを流すためにsinkを渡す
        )
    );
  }


  @override
  void initState() {
    super.initState();
    viewCtrl = ViewCtrlBloc(); //<-Blocをインスタンス化
  }

  @override
  void dispose() {
    viewCtrl!.dispose(); //<- 忘れずdispose
    super.dispose();
  }
}
