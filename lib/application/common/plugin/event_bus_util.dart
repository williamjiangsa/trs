import 'package:event_bus/event_bus.dart';

class EventBusUtil {
  // 工厂模式
  factory EventBusUtil() => _getInstance();

  static EventBusUtil get instance => _getInstance();
  static EventBusUtil _instance;
  EventBus eventBus;

  EventBusUtil._internal() {
    // 初始化
    eventBus=EventBus();
  }

  static EventBusUtil _getInstance() {
    if (_instance == null) {
      _instance = new EventBusUtil._internal();
    }
    return _instance;
  }
}
