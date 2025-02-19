import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.height,
    required this.width,
    this.child,
    this.color,
    this.borderRadius,
    this.borderColor,
    this.padding,
    this.margin,
    this.alignment,
    this.boxShadow,
    this.gradient,
  });

  final double height;
  final double width;
  final Widget? child;
  final Color? color;
  final BorderRadius? borderRadius;
  final Border? borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: borderColor,
        boxShadow: boxShadow,
        gradient: gradient,
      ),
      child: child,
    );
  }
}