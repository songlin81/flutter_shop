import 'package:flutter/material.dart';

class JellyButton extends StatefulWidget {

  final Duration duration;
  final Size size;
  final VoidCallback onTap;
  final String unCheckedImgAsset;
  final String checkedImgAsset;
  final bool checked;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  const JellyButton({
    this.duration = const Duration(milliseconds: 500),
    this.size = const Size(80.0, 80.0),
    this.onTap,
    @required this.unCheckedImgAsset,
    @required this.checkedImgAsset,
    this.checked = false,
    this.backgroundColor = Colors.transparent,
    this.padding = const EdgeInsets.all(8.0)
  });

  @override
  _JellyButtonState createState() => _JellyButtonState();
}

class _JellyButtonState extends State<JellyButton> with TickerProviderStateMixin {

  AnimationController _controller;
  CurvedAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    Animation<double> linearAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation = CurvedAnimation(parent: linearAnimation, curve: Curves.elasticOut);
    _controller.forward(from: 1.0);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _playAnimation();
        if (widget.onTap != null) {
          widget.onTap();
        }
      },
      child: Container(
        constraints: BoxConstraints(minWidth: widget.size.width, minHeight: widget.size.height),
        color: widget.backgroundColor,
        padding: widget.padding,
        child: Center(
          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Image.asset(
                  widget.checked ? widget.checkedImgAsset : widget.unCheckedImgAsset,
                  width: _animation.value * (widget.size.width - widget.padding.horizontal) / 1.55,
                  height: _animation.value * (widget.size.height - widget.padding.vertical) / 1.55,
                );
              }
          ),
        ),
      ),
    );
  }

  void _playAnimation() {
    _controller.forward(from: 0.0);
  }
}