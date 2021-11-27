import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDtailView extends StatelessWidget {
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
            ClipOval(
              clipBehavior: Clip.hardEdge,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.network('https://4.bp.blogspot.com/-MSnCCDbY2ok/VYJrrLjwhPI/AAAAAAAAuiE/l_dcVIvJ5Ac/s400/nigaoe_zabieru_xavier.p'),
              ),
            ),
            new Text(
              'フランシスコ・ザビエル',
              style: TextStyle(
                color: Colors.black,
                fontSize: 45,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                SizedBox(
                  child: TextButton.icon(
                  onPressed: () {},
                    icon: Icon(FontAwesomeIcons.check, size: 45, color: Colors.black),
                    label: new Text(
                          '投稿する',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 45,
                          ),
                        ),
                      ),
                  height: 150,
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
                  child: TextButton.icon(
                  onPressed: () {},
                      icon: Icon(FontAwesomeIcons.bookmark, size: 45, color: Colors.black),
                      label: new Text(
                        'ブックマーク',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                ),
                  height: 80,
                  width: 350,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  child: TextButton.icon(
                  onPressed: () {},
                      icon: Icon(FontAwesomeIcons.shoppingCart, size: 45, color: Colors.black),
                      label: new Text(
                        'お気に入りの店',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                ),
                  height: 80,
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

class SearchPageBorderRadius {
}