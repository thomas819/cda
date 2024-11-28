import 'package:flutter/material.dart';

class KeepStateWidget extends StatefulWidget {
  final Widget child;

  const KeepStateWidget({super.key, required this.child});

  @override
  State<KeepStateWidget> createState() => _KeepStateWidgetState();
}

class _KeepStateWidgetState extends State<KeepStateWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
