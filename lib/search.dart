import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapping Matching',
      theme: ThemeData(
        textTheme: GoogleFonts.sawarabiMinchoTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      // リスト一覧画面を表示
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __State();
  }
}

// 検索画面用Widget
class __State extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              child: TextFormField(
              // initialValue: 'Input text',
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  FontAwesomeIcons.search,
                ),
              ),
            ),
              height: 50,
              width: 500,
            ),
            Container(
              padding: EdgeInsets.only(top: 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                SizedBox(
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.mapMarkedAlt, size: 45, color: Colors.black),
                      label: new Text(
                        '現在地近くから探す',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow, //ボタンの背景色
                      ),
                    ),
                  height: 50,
                  width: 350,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                SizedBox(
                  child: ElevatedButton(
                  onPressed: () {},
                  child: new Text(
                        '節約情報',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                ),
                  height: 50,
                  width: 350,
                ),
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
}