import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './searching.dart';
import './userpage.dart';

import './header.dart';
import './footer.dart';

import './page/view.dart';
import './bloc/view-ctrl-bloc.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(const startApp());
}

class startApp extends StatelessWidget {
  const startApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: Splash());
        } else {
          return MaterialApp(home: MyApp());
        }
      },
    );
  }
}

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

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/glass.png'),
            const Text(
              'マピマチ',
              style: TextStyle(
                fontSize: 80,
              ),
            ),
            const Text(
              '地域密着マッピングマッチング',
            ),
          ],
        ),
      ),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 5));
  }
}