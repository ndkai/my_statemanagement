

class EventHandle<T> {
  final Map<Type, Function> _handlers = {};

  void register<T>(void Function(T event) handler) {
    _handlers[T] = handler;
    print("register");
  }

  void handle(T event) {
    final handleE = _handlers[event.runtimeType];
    if(handleE != null){
      handleE(event);
    } else {
      throw Exception("No handler found for event type: ${T.runtimeType}");
    }
  }
}