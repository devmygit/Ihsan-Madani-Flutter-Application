// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madani/src/index.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<NavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final activeColor = context
            .watch<AccessibilityCubit>()
            .state
            .resetColor
        ? getThemePrimaryColor(0)
        : getThemePrimaryColor(context
            .watch<AccessibilityCubit>()
            .state
            .indexColor); // Theme color for active state
    const greyColor = Color(0xFF808080); // Grey color for inactive state
    
    return Container(
      decoration: const BoxDecoration(
        color: MadaniColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Container(
        height: 65.h,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items.map((e) {
              final index = items.indexOf(e);
              final isActive = index == currentIndex;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    onTap(index);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Theme color underline for active item
                        if (isActive)
                          Container(
                            height: 3,
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 4.h),
                            decoration: BoxDecoration(
                              color: activeColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(2),
                                topRight: Radius.circular(2),
                              ),
                            ),
                          ),
                        // Use active icon if available, otherwise use regular icon with color filter
                        e.activeIconPath != null && isActive
                            ? SvgPicture.asset(
                                e.activeIconPath!,
                                width: 24.r,
                                height: 24.r,
                              )
                            : SvgPicture.asset(
                                e.iconPath,
                                colorFilter: ColorFilter.mode(
                                  isActive ? activeColor : greyColor,
                                  BlendMode.srcIn,
                                ),
                                width: 24.r,
                                height: 24.r,
                              ),
                        SizedBox(height: 4.h),
                        Text(
                          e.label,
                          style: TextStyleMadani.textStyle.interText.copyWith(
                            color: isActive ? activeColor : greyColor,
                            fontSize: 12.sp,
                            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
    );
  }
}

class NavigationBarItem {
  final String iconPath;
  final String? activeIconPath; // Optional active icon path
  final String label;

  NavigationBarItem({
    required this.iconPath,
    this.activeIconPath,
    required this.label,
  });
}
