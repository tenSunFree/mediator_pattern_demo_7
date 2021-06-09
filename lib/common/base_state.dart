import 'package:flutter/material.dart';
import 'package:mediator_pattern_demo_7/common/base_state_hub.dart';

abstract class BaseState {
  final Widget? widget;
  BaseStateHub? hub;

  BaseState(this.widget);

  void sendState<T extends BaseState>({required Function refresh}) {
    hub?.sendState<T>();
  }
}
