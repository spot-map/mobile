import 'package:flutter/material.dart';
import 'package:flutter_stream_listener/flutter_stream_listener.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold(
      {super.key,
      required this.appBar,
      required this.message,
      required this.onMessage,
      required this.child,
      required this.resizeToAvoidBottomInset,
      required this.extendBodyBehindAppBar});

  final PreferredSizeWidget appBar;
  final Stream<String> message;
  final Function(String) onMessage;
  final Widget child;
  final bool resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        body: StreamListener(
          stream: message,
          onData: onMessage,
          child: child,
        ));
  }
}
