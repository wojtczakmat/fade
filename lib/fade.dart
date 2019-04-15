import 'package:flutter/material.dart';

class Fade extends StatefulWidget {
  const Fade(
      {Key key,
      @required this.child,
      @required this.visible,
      Duration duration})
      : this.duration = duration ?? const Duration(milliseconds: 200),
        super(key: key);

  final Widget child;
  final bool visible;
  final Duration duration;

  @override
  _FadeState createState() => _FadeState();
}

class _FadeState extends State<Fade> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = new AnimationController(
      value: widget.visible ? 1.0 : 0.0,
      duration: widget.duration,
      vsync: this,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(Fade oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!oldWidget.visible && widget.visible) {
      _animationController.forward();
    } else if (oldWidget.visible && !widget.visible) {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: new CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
      child: SizeTransition(
        axisAlignment: 1,
        sizeFactor: new CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        ),
        child: widget.child,
      ),
    );
  }
}
