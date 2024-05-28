import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

// <---------------------DIAGONAL--------------------->
class DiagonalPiece extends StatelessWidget {
  const DiagonalPiece({
    super.key,
    required double overallHeight,
    required double cutting,
    required this.color,
  })  : _height = overallHeight,
        _cutting = cutting;

  final double _height;
  final double _cutting;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _DiagonalClipper(_cutting),
      child: Container(
        height: _height,
        color: color,
      ),
    );
  }
}

class _DiagonalClipper extends CustomClipper<Path> {
  _DiagonalClipper(this.cutting);

  final double cutting;

  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, min(cutting, size.height))
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ArcXXX extends StatelessWidget {
  const ArcXXX({
    super.key,
    required double radius,
    required Color color,
    required double blur,
  })  : _blur = blur,
        _radius = radius,
        _color = color;

  final double _radius;
  final double _blur;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _ArcClipper(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
        child: ClipPath(
          clipper: _ArcClipper(),
          child: Container(
            height: _radius,
            width: _radius * 2,
            color: _color,
          ),
        ),
      ),
    );
  }
}

class _ArcClipper extends CustomClipper<Path> {
  _ArcClipper();

  @override
  Path getClip(Size size) {
    return Path()
      ..arcTo(
        Rect.fromCenter(
          center: Offset(size.height / 2, size.width / 2),
          height: size.height,
          width: size.width,
        ),
        pi,
        pi,
        false,
      )
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ArcPiece extends StatelessWidget {
  const ArcPiece({
    super.key,
    required double radius,
    required Color color,
  })  : _radius = radius,
        _color = color;

  final double _radius;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ArcPainter(color: _color),
      size: Size(_radius, _radius),
    );
  }
}

class ArcPainter extends CustomPainter {
  ArcPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.height / 2, size.width / 2),
          height: size.height,
          width: size.width,
        ),
        pi,
        pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// <---------------------LEGACY--------------------->
class Puddle extends StatelessWidget {
  const Puddle({super.key, required dynamic height}) : _height = height;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: _height,
        width: double.infinity,
        child: Image.asset('assets/images/dishes.jpg'),
        // const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     colors: [
        //       Color(0xFF50c83c),
        //       Color(0xFFc0fa96),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final double bend = 80;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - bend);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - bend);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RoundedPiece extends StatelessWidget {
  const RoundedPiece({super.key, required dynamic height, required Color color})
      : _height = height,
        _color = color;
  final double _height;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    //todo https://stackoverflow.com/questions/58350235/add-border-to-a-container-with-borderradius-in-flutter
    return ClipPath(
      clipper: RoundOnlyClipper(_height),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),

        height: _height,
        width: double.infinity,
        color: _color,
        // const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     colors: [
        //       Color(0xFF50c83c),
        //       Color(0xFFc0fa96),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

class RoundOnlyClipper extends CustomClipper<Path> {
  RoundOnlyClipper(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(radius, 0)
      ..arcTo(Rect.fromLTWH(0, 0, 2 * radius, 2 * radius), -pi, -pi / 2, false)
      ..lineTo(size.width - radius, 0)
      ..arcTo(Rect.fromLTWH(size.width - 2 * radius, 0, 2 * radius, 2 * radius),
          -pi / 2, -pi / 2, false)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
