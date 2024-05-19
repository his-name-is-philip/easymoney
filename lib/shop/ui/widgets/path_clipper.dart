import 'package:flutter/cupertino.dart';

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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
        ),
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
