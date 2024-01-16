import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/custom_shape/curve/curve_edges.dart';

class CurveEdgesWidget extends StatelessWidget {
  const CurveEdgesWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
