import 'package:flutter/material.dart';
import 'package:mediator_pattern_demo_7/common/base_state_hub.dart';
import 'package:mediator_pattern_demo_7/home/state/state.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BaseStateHub _hub;
  late LoadingState _loadingState;
  late EmptyState _emptyState;
  late SuccessState _successState;
  late ErrorState _errorState;

  @override
  void initState() {
    super.initState();
    _loadingState = LoadingState(widget: _buildLoadingView());
    _emptyState = EmptyState(widget: _buildEmptyView());
    _successState = SuccessState(widget: _buildSuccessView());
    _errorState = ErrorState(widget: _buildErrorView());
    final _states = [_loadingState, _emptyState, _successState, _errorState];
    _hub = HomeStateHub(states: _states);
    startLoading();
  }

  Widget _buildLoadingView() {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Image.asset('assets/icon_empty.png'),
      Container(
          child: Column(children: <Widget>[
        Expanded(child: Container(), flex: 10),
        CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF803DB0))),
        Expanded(child: Container(), flex: 1),
        Text("讀取中", style: TextStyle(color: Color(0xFFA7A7A7), fontSize: 14)),
        Expanded(child: Container(), flex: 20)
      ]))
    ]);
  }

  Widget _buildEmptyView() {
    return Image.asset('assets/icon_empty.png');
  }

  Widget _buildSuccessView() {
    return Image.asset('assets/icon_success.png');
  }

  Widget _buildErrorView() {
    return GestureDetector(
        onTap: () {
          startLoading();
        },
        child: Image.asset('assets/icon_error.png'));
  }

  void startLoading() {
    setState(() {
      _loadingState.sendState<LoadingState>(refresh: () {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Container(child: _hub.getCurrentState().widget));
}
