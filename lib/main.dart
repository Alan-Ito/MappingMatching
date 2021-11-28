import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mappingmatching/controllers/auth_controller.dart';
import 'package:mappingmatching/pages/userpage.dart';

import 'bloc/view-ctrl-bloc.dart';
import 'footer.dart';
import 'header.dart';
import 'pages/auth/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // statelessからstatefulに変更
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyApp(); //MyAppクラスのState
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: UserPage()//const MyHomePage(title: 'MappingMatching'),
    );
  }
}

class _MyApp extends State<MyApp> {
  ViewCtrlBloc? viewCtrl;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: Header(),
          body:
              sign_up_page(), //View(viewCtrl: viewCtrl!.viewStream), // 受け取るためにstreamを渡す
          bottomNavigationBar:
              Footer(viewCtrl: viewCtrl!.viewSink), // インデックスを流すためにsinkを渡す
        ));
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
