import 'dart:async';

enum CounterAction { Increment, Decrement, Reset }

class CounterBloc {
  final _stateStreamController = StreamController<String>();
  StreamSink<String> get counterSink => _stateStreamController.sink;
  Stream<String> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  int counter = 0;

  CounterBloc() {
    counter = 0;

    // eventStream.listen(
    //   (event) {
    //     if (event == CounterAction.Increment) counter++;
    //   },
    // );
  }
}
