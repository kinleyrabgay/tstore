import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/custom_shape/container/circular_container.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class TColorChip extends StatelessWidget {
  const TColorChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        selected: selected,
        onSelected: onSelected,
        avatar: isColor
            ? TCircularContainer(
                width: 50,
                height: 50,
                radius: 50,
                backgroundColor: THelperFunctions.getColor(text)!,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
        labelPadding: isColor ? EdgeInsets.zero : null,
        padding: isColor ? EdgeInsets.zero : null,
        selectedColor: isColor ? THelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
