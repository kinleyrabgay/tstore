import 'package:flutter/material.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/device/device_utility.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TabBar(
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      indicatorColor: dark ? TColors.black : TColors.primary,
      labelColor: dark ? TColors.white : TColors.dark,
      unselectedLabelColor: TColors.dark.withOpacity(0.4),
      tabs: tabs,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
