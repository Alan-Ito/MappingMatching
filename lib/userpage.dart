import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPage extends StatelessWidget {
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
      home: UserDetail(),
    );
  }
}

class UserDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __State();
  }
}

class __State extends State<UserDetail> {

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
                // child: Image.network('https://4.bp.blogspot.com/-MSnCCDbY2ok/VYJrrLjwhPI/AAAAAAAAuiE/l_dcVIvJ5Ac/s400/nigaoe_zabieru_xavier.p'),
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
                    icon: Icon(Icons.check, size: 45, color: Colors.black),
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
                      icon: Icon(Icons.bookmark, size: 45, color: Colors.black),
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
                      icon: Icon(Icons.shopping_cart, size: 45, color: Colors.black),
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