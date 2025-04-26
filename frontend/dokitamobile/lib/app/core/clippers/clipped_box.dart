import 'package:flutter/material.dart';

class ClippedBox extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height * 0.49); // 171.999 / 351
    path.cubicTo(
      0,
      size.height * 0.29, // start control point
      size.width * 0.12,
      size.height * 0.12, // second control
      size.width * 0.295,
      size.height * 0.074, // endpoint (115.545 / 391, 26.0095 / 351)
    );

    path.lineTo(
      size.width * 0.528,
      size.height * 0.013,
    ); // (206.545 / 391, 4.53276 / 351)

    path.cubicTo(
      size.width * 0.769,
      size.height * -0.050, // start control
      size.width,
      size.height * 0.15, // second control
      size.width,
      size.height * 0.429, // endpoint (391 / 391, 150.522 / 351)
    );

    path.lineTo(size.width, size.height * 0.51); // 179.001 / 351

    path.cubicTo(
      size.width,
      size.height * 0.708, // start control
      size.width * 0.878,
      size.height * 0.88, // second control
      size.width * 0.704,
      size.height * 0.926, // endpoint (275.455 / 391, 324.99 / 351)
    );

    path.lineTo(
      size.width * 0.472,
      size.height * 0.987,
    ); // 184.455 / 391, 346.467 / 351

    path.cubicTo(
      size.width * 0.231,
      size.height * 1.050, // start control
      0,
      size.height * 0.85, // second control
      0,
      size.height * 0.571, // endpoint (0, 200.478 / 351)
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}