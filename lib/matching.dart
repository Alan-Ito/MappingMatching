import 'package:flutter/material.dart';

class MatchingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // padding: const EdgeInsets.all(0.5),
          height: 580,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/sample.jpg'),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 100.0,
                  )),
              //child: Column(Text()),
              Text('post',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 80.0,
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
