import 'package:flutter/material.dart';

import '../style/color.dart';

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DecoratedTabBar({super.key, required this.tabBar, this.decoration});

  final TabBar tabBar;
  final BoxDecoration? decoration;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration?? BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.iconColorV1.withOpacity(0.2),
              width: 1.0,
            ),
          ),
        ))),
        tabBar,
      ],
    );
  }
}