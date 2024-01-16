import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/custom_shape/container/circular_container.dart';
import 'package:tstore/common/widgets/custom_shape/curve/curve_edges_widget.dart';
import 'package:tstore/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurveEdgesWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                  radius: 400,
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                  radius: 400,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
