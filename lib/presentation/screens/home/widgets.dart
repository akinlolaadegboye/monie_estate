import 'package:flutter/material.dart';
import 'package:monie_estate/presentation/utils/general_utils.dart';
import 'package:monie_estate/presentation/values/colors.dart';

/// BOTTOM_NAVIGATION

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final bool isActive;
  final Function onTap;

  const BottomNavItem({super.key, required this.icon, required this.bgColor, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: AppColors.pry.withOpacity(0.2),
      onTap: () {
        onTap();
      },
      child: Container(
        height: isActive ? 55 : 45,
        padding: const EdgeInsets.all(5),
        // width: GeneralUtils().getScreenWidth(context) * .2,
        child:  CircleAvatar(
          backgroundColor: bgColor,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(icon, color: AppColors.whiteColor, size: 20,),
          ),
        ),
      ),
    );
  }
}
