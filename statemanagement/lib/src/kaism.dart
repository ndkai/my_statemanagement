import 'dart:async';

import 'package:statemanagement/src/event_handle.dart';

abstract class _KaiSM{
  void dispose();
}

abstract class KaiSM<E, S> implements _KaiSM{
  final _controller = StreamController<S>();
  Stream<S> get stream => _controller.stream;
  late EventHandle<E> handle;
  late S currentState;
  late E currentEvent;

  KaiSM(S initialState){
    currentState = initialState;
    updateState(initialState);
    handle = EventHandle<E>();
  }

  @override
  void dispose() {
    _controller.close();
  }


  void add(E event) {
    handle.handle(event);
  }

  void updateState(S state) {
    if(currentState == S){
      return;
    }
    _controller.add(state);
  }



}




