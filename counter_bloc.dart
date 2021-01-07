import 'dart:async';

enum CounterAction { SumEvent }

class CounterBloc {
  final _stateStreamController = StreamController<String>();
  StreamSink<String> get counterSink => _stateStreamController.sink;
  Stream<String> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  // void SumEvent(String k) {
  //   eventStream.listen(
  //     (event) {
  //       if (event == CounterAction.SumEvent) {
  //         k = "72";
  //         counterSink.add(k);
  //       }
  //     },
  // );
  // }
}
