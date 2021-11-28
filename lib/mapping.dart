import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MappingPage extends StatelessWidget {
  MappingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
          title: 'Flutter Google Maps Demo',
          home: MapSample(),
      )
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State createState() => MapSampleState();
}

class MapSampleState extends State {
  Completer _controller = Completer();

  static final CameraPosition _kNSK = CameraPosition(
    target: LatLng(35.17176088096857, 136.88817886263607),
    zoom: 14.4746,
  );

  static final CameraPosition _kNagoyajo = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(35.184910766826086, 136.8996468623372),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kNSK,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheNagoyajo,
        label: Text('To the 名古屋城!'),
        icon: Icon(Icons.directions_bike),
      ),
    );
  }

  Future _goToTheNagoyajo() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kNagoyajo));
  }
}