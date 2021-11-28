import 'dart:async';

class ViewCtrlBloc {
  final _viewCtrl = StreamController<int>();

  Sink<int> get viewSink => _viewCtrl.sink;
  Stream<int> get viewStream => _viewCtrl.stream;

  void dispose() {
    _viewCtrl.close();
  }
}