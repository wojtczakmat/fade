import 'package:flutter/material.dart';

class Fade extends StatefulWidget {
  const Fade({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  _FadeState createState() => _FadeState();
}

class _FadeState extends State<Fade> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: null,
      child: widget.child,
    );
  }
}
