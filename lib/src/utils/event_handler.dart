import 'dart:async';

class EventHandler<T> {
  final _streamController = StreamController<T>.broadcast(sync: true);

  Stream<T> get stream => _streamController.stream;

  void addEventListener(void Function(T e) onData) {
    stream.listen(onData);
  }

  void notify(T data) {
    _streamController.add(data);
  }
}
