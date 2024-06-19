import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final String text;
  final double? top;
  final double? right;

  const NotificationBadge({
    super.key,
    this.width = 14.0,
    this.height = 14.0,
    this.fontSize = 10.0,
    this.text = '',
    this.top,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
      ),
      child: Center(
        child: Text(
          text, // The number to display
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
