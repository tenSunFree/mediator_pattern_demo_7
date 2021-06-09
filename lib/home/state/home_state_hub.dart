import 'package:mediator_pattern_demo_7/common/base_state.dart';
import 'package:mediator_pattern_demo_7/common/base_state_hub.dart';

class HomeStateHub extends BaseStateHub {
  final _states = <BaseState>[];
  late BaseState _currentState;

  HomeStateHub({required List<BaseState>? states}) {
    states?.forEach(register);
  }

  @override
  List<BaseState> getStates() => _states;

  @override
  BaseState getCurrentState() => _currentState;

  @override
  void register(BaseState state) {
    state.hub = this;
    _states.add(state);
  }

  @override
  void sendState<T extends BaseState>({BaseState? baseState}) {
    _currentState = _states.whereType<T>().first;
  }
}
