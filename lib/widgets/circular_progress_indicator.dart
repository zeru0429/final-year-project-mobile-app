import 'package:flutter/material.dart';

class AnimatedCircularProgressIndicatorWidget extends StatefulWidget {
  const AnimatedCircularProgressIndicatorWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedCircularProgressIndicatorWidgetState createState() =>
      _AnimatedCircularProgressIndicatorWidgetState();
}

class _AnimatedCircularProgressIndicatorWidgetState
    extends State<AnimatedCircularProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..addListener(() {
        setState(() {});
      });
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: _animation.value,
      ),
    );
  }
}
