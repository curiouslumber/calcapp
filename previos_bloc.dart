import 'dart:async';

class PreviousBloc {
  final _stateStreamController = StreamController<String>();
  StreamSink<String> get previousSink => _stateStreamController.sink;
  Stream<String> get previousStream => _stateStreamController.stream;
}
