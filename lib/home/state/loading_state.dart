import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mediator_pattern_demo_7/common/base_state.dart';
import 'package:mediator_pattern_demo_7/home/state/state.dart';

class LoadingState extends BaseState {
  LoadingState({required Widget widget}) : super(widget);

  @override
  void sendState<T extends BaseState>({required Function refresh}) async {
    debugPrint('LoadingState, sendState');
    super.sendState<T>(refresh: refresh);
    await Future.delayed(const Duration(seconds: 3)).then((_) {
      debugPrint('LoadingState, sendState2');
      final random = Random().nextInt(3) + 1;
      debugPrint('LoadingState, sendState2, random: $random');
      switch (random % 3) {
        case 0:
          hub?.sendState<EmptyState>();
          break;
        case 1:
          hub?.sendState<SuccessState>();
          break;
        case 2:
          hub?.sendState<ErrorState>();
          break;
      }
      refresh();
    });
  }

  Future getData() async {}
}
