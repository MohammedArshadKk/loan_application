import 'package:flutter/material.dart';

class BottomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 30.0; // Adjust the curve depth

    Path path = Path();
    path.moveTo(0, radius);

    // Left curve
    path.quadraticBezierTo(0, 0, radius, 0);

    // Top straight line
    path.lineTo(size.width - radius, 0);

    // Right curve
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Bottom part (straight)
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
