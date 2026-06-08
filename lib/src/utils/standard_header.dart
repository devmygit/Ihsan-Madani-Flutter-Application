import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madani/src/index.dart';
import 'package:url_launcher/url_launcher.dart';

class StandardHeader extends StatelessWidget {
  const StandardHeader({
    super.key,
    this.onSearchTap,
    this.onFaqTap,
    this.onEnvelopeTap,
    this.onW3CTap,
    this.onSemakBantuanTap,
  });

  final VoidCallback? onSearchTap;
  final VoidCallback? onFaqTap;
  final VoidCallback? onEnvelopeTap;
  final VoidCallback? onW3CTap;
  final VoidCallback? onSemakBantuanTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top bar (light blue) - Compact
        Container(
          height: 32.h,
          color: context
                  .watch<AccessibilityCubit>()
                  .state
                  .resetColor
              ? getThemeLightColor(0)
              : getThemeLightColor(context
                  .watch<AccessibilityCubit>()
                  .state
                  .indexColor), // Light theme color
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // W3C button on left - Light grey background
              GestureDetector(
                  onTap: onW3CTap ?? () {
                    final screenHeight = MediaQuery.sizeOf(context).height;
                    final containerHeight = 180.0;
                    // Calculate center position vertically
                    final centerY = (screenHeight - containerHeight) / 2;
                    
                    if (context.read<AccessibilityCubit>().state.hide) {
                      context
                          .read<AccessibilityCubit>()
                          .postionedContainer(centerY);
                      context
                          .read<AccessibilityCubit>()
                          .openAccessibility(false);
                    } else {
                      context
                          .read<AccessibilityCubit>()
                          .openAccessibility(true);
                    }
                  },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF), // White
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: MadaniColor.grey, width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/IM-w3c.svg',
                        width: 14.r,
                        height: 14.r,
                        colorFilter: const ColorFilter.mode(
                          MadaniColor.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        'W3C',
                        style: TextStyleMadani.textStyle.interText.copyWith(
                          fontSize: 9.sp,
                          color: MadaniColor.black,
                          //fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // FAQ and Email icons on right - Icon only
              Row(
                children: [
                  GestureDetector(
                    onTap: onFaqTap ?? () {
                      Navigator.of(context, rootNavigator: true).pushNamed(FaqRoutes.initialRoute);
                    },
                    child: SvgPicture.asset(
                      'assets/images/IM-FAQ.svg',
                      //width: 20.r,
                      height: 15.r,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFEC1C7C), // Pink color
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  // Grey separator
                  Container(
                    width: 1.w,
                    height: 15.h,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 12.w),
                  GestureDetector(
                    onTap: onEnvelopeTap ?? () async {
                      try {
                        final emailUri = Uri.parse(
                          'mailto:secretariat.naccol@kpdn.gov.my',
                        );
                        await launchUrl(
                          emailUri,
                          mode: LaunchMode.externalApplication,
                        );
                      } catch (e) {
                        Fluttertoast.showToast(
                          msg: 'Couldn\'t launch email',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          backgroundColor: MadaniColor.black,
                          textColor: MadaniColor.white,
                        );
                        log('Error launching email: $e');
                      }
                    },
                    child: Transform.translate(
                      offset: Offset(0, -1.5.h),
                      child: SvgPicture.asset(
                        'assets/images/IM-Email.svg',
                        //width: 20.r,
                        height: 12.r,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFEC1C7C), // Pink color
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Main header (dark blue)
        Container(
          decoration: BoxDecoration(
            color: context
                    .watch<AccessibilityCubit>()
                    .state
                    .resetColor
                ? getThemeDarkColor(0)
                : getThemeDarkColor(context
                    .watch<AccessibilityCubit>()
                    .state
                    .indexColor), // Dark theme color
          ),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: 12.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Group 1: Jata Negara Logo + Title Text (50% - kiri)
              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // 1. Jata Negara Logo
                    SvgPicture.asset(
                      'assets/images/Jata-Negara.svg',
                      height: 30.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10.w),
                    // 2. Title Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'MAJLIS TINDAKAN',
                            style: TextStyleMadani.textStyle.interText.copyWith(
                              fontSize: 8.sp,
                              color: MadaniColor.white,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'SARA HIDUP NEGARA',
                            style: TextStyleMadani.textStyle.interText.copyWith(
                              fontSize: 8.sp,
                              color: MadaniColor.white,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '(NACCOL)',
                            style: TextStyleMadani.textStyle.interText.copyWith(
                              fontSize: 8.sp,
                              color: MadaniColor.white,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Separator 1 (transparent untuk spacing yang sama)
              SizedBox(width: 6.w),
              // Group 2 & 3 Combined: Malaysia-Madani Logo + Ihsan-Madani-Portal Logo
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Image.asset(
                        'assets/images/Malaysia-Madani.png',
                        height: 30.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Flexible(
                      child: Image.asset(
                        'assets/images/ihsan-madani-portal-logo.png',
                        height: 30.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Semak Bantuan Khusus Button and Search Icon - Same Row
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            top: 4.h,
            bottom: 12.h,
          ),
          decoration: BoxDecoration(
            color: context
                    .watch<AccessibilityCubit>()
                    .state
                    .resetColor
                ? getThemeDarkColor(0)
                : getThemeDarkColor(context
                    .watch<AccessibilityCubit>()
                    .state
                    .indexColor), // Dark theme color
          ),
          child: Row(
            children: [
              // Button on left
              Expanded(
                child: Container(
                  height: 38.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFEC1C7C), // Pink
                        Color(0xFFD91A93), // Darker pink
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF9ED8),
                        offset: const Offset(0, 3),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: onSemakBantuanTap ?? () async {
                      // Show loading dialog using rootNavigator
                      final navigator = Navigator.of(context, rootNavigator: true);
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (dialogContext) {
                          return const AlertDialog(
                            content: Row(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(width: 20),
                                Text("Memproses..."),
                              ],
                            ),
                          );
                        },
                      );
                      
                      // Wait a bit for dialog to show
                      await Future.delayed(const Duration(milliseconds: 300));
                      
                      // Navigate and close dialog
                      if (context.mounted) {
                        // Close dialog first
                        navigator.pop();
                        
                        // Then navigate using rootNavigator to push fullscreen and hide bottom navigation bar
                        await Future.delayed(const Duration(milliseconds: 50));
                        if (context.mounted) {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            QuestionPageRoutes.initialRoute,
                          );
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.transparent),
                      shadowColor:
                          WidgetStateProperty.all(Colors.transparent),
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text(
                      'Semak Bantuan Khusus',
                      style: TextStyleMadani.textStyle.interText.copyWith(
                        fontSize: 15.sp,
                        color: MadaniColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              // Search icon on right - transparent, icon only
              GestureDetector(
                onTap: onSearchTap ?? () {
                  // Use rootNavigator to push SearchPage fullscreen and hide bottom navigation bar
                  Navigator.of(context, rootNavigator: true).pushNamed(MadaniRoutes.searchPageRoute);
                },
                child: SvgPicture.asset(
                  'assets/images/search.svg',
                  width: 22.r,
                  height: 22.r,
                  colorFilter: const ColorFilter.mode(
                    MadaniColor.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

