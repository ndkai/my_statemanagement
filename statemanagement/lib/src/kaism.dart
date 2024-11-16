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

  void updateState(S state) {
    _controller.add(state);
  }



}

class TestBloc extends KaiSM<EventX, StateX>{
  TestBloc(): super(StateX1()){
    handle.register<EventX1>((event){
      _get(event);
    });

    handle.register<EventX2>((event){
      _get1(event);
    });
  }

  void _get(EventX1 event) async {
    updateState(StateX1());
  }
  void _get1(EventX2 event) async {
    updateState(StateX2());
  }
}

abstract class EventX{

}

class EventX1 extends EventX{

}

class EventX2 extends EventX{

}

abstract class StateX{

}

class StateX1 extends StateX{

}

class StateX2 extends StateX{

}

