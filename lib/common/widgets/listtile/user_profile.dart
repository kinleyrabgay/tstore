import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/widgets/image/t_circular_image.dart';
import 'package:tstore/utils/constants/colors.dart';

class TProfile extends StatelessWidget {
  const TProfile({
    super.key,
    required this.imgUrl,
    this.onPressed,
  });

  final String imgUrl;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        image: imgUrl,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Coding with T',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        'Support@codingwithT.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
