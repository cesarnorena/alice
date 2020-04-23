import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    @required this.body,
  }) : assert(body != null);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body),
    );
  }
}
