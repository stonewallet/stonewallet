import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSpinKitFadingCube extends StatelessWidget {
  final Color color;
  final double size;

  const CustomSpinKitFadingCube({
    super.key,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(
      color: color,
      size: size,
    );
  }
}