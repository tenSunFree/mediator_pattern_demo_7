import 'package:mediator_pattern_demo_7/common/base_state.dart';

abstract class BaseStateHub {
  List<BaseState> getStates();

  BaseState getCurrentState();

  void register(BaseState state);

  void sendState<T extends BaseState>();
}
