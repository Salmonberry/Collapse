import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NetworkLoadingWidget extends StatefulWidget {
  const NetworkLoadingWidget({Key? key}) : super(key: key);

  @override
  State<NetworkLoadingWidget> createState() => _NetworkLoadingWidgetState();
}

class _NetworkLoadingWidgetState extends State<NetworkLoadingWidget> {
  late Future _future;

  @override
  void initState() {
    super.initState();

    ///初始化 网络请求
    // _future = widget._presenter.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: _buildFuture,
      ),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return const Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return const Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return _buildPage();
      default:
        return Container();
    }
  }

  Widget _buildPage() => Container();
}
