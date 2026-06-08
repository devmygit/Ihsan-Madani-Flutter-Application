import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madani/src/index.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_info_plus/device_info_plus.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool _readyToNavigate = false;

  @override
  void initState() {
    super.initState();
    _checkVersionAndNavigate();
  }

  Future<String> _getPlatformEndpoint() async {
    try {
      if (Platform.isIOS) {
        return 'ios';
      } else if (Platform.isAndroid) {
        // Check if device is Huawei (including HarmonyOS)
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        String manufacturer = androidInfo.manufacturer.toLowerCase();
        String brand = androidInfo.brand.toLowerCase();
        String model = androidInfo.model.toLowerCase();
        
        // Check for Huawei devices (including HarmonyOS)
        // HarmonyOS devices are still detected as Android in Flutter
        // but we can identify them by manufacturer/brand
        if (manufacturer.contains('huawei') || 
            brand.contains('huawei') || 
            model.contains('huawei')) {
          return 'huawei';
        }
        return 'android';
      }
    } catch (e) {
      log('Error detecting platform: $e');
    }
    // Default to android if platform detection fails
    return 'android';
  }

  Future<void> _checkVersionAndNavigate() async {
    try {
      // Step 1: Check network connectivity and API accessibility
      log('Checking network and API accessibility...');
      final networkCheck = await NetworkChecker().checkNetworkAndApi();
      
      if (!networkCheck.isAllGood) {
        // Show error dialog if network or API is not accessible
        if (mounted) {
          _showNetworkErrorDialog(context, networkCheck.errorMessage ?? 'Ralat tidak diketahui');
        }
        return;
      }

      log('Network and API check passed');

      // Step 2: Get app version
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String appVersion = packageInfo.version;
      log('App version: $appVersion');

      // Step 3: Get platform endpoint
      String platform = await _getPlatformEndpoint();
      log('Platform: $platform');

      // Step 4: Check version with API
      Dio dio = await HttpsConfig().getDio(
        visitorId: null,
        queries: {},
      );
      Response response = await dio.get('/version/$platform');

      if (response.statusCode == 200 && response.data['status'] == 'success') {
        String apiVersion = response.data['data']['version'] ?? '';
        String downloadUrl = response.data['data']['download_url'] ?? '';
        log('API version: $apiVersion');

        // Compare versions
        if (appVersion != apiVersion) {
          // Show dialog to update
          if (mounted) {
            _showUpdateDialog(context, downloadUrl);
          }
          return;
        }
      }
    } catch (e) {
      log('Error checking version: $e');
      // If there's an error, check if it's network/API related
      if (mounted) {
        _showNetworkErrorDialog(
          context,
          'Tidak dapat menyambung ke pelayan. Sila pastikan peranti anda disambungkan ke internet dan cuba lagi.',
        );
      }
      return;
    }

    // Stop auto navigation, show button instead.
    if (mounted) {
      setState(() {
        _readyToNavigate = true;
      });
    }
  }

  void _navigateToNextPage() {
    try {
      final launchingAt = context
          .read<AccessibilityCubit>()
          .state
          .launchingStatusModel
          .launchingAt;
      
      bool shouldShowCountdown = false;
      
      if (launchingAt != null && launchingAt.isNotEmpty) {
        try {
          // Try to parse the date string
          final launchDate = DateTime.parse(launchingAt);
          shouldShowCountdown = DateTime.now().isBefore(launchDate);
        } catch (e) {
          log('Error parsing launch date: $e, date string: $launchingAt');
          // If parsing fails, use default date
          shouldShowCountdown = DateTime.now().isBefore(
            DateTime.parse('2023-08-23 15:00:00')
          );
        }
      } else {
        // If launchingAt is null or empty, use default date
        shouldShowCountdown = DateTime.now().isBefore(
          DateTime.parse('2023-08-23 15:00:00')
        );
      }
      
      if (shouldShowCountdown) {
        Navigator.of(context).pushReplacementNamed(
          MadaniRoutes.countdownRoute,
        );
      } else {
        Navigator.of(context).pushReplacementNamed(
          MadaniRoutes.mainpageRoute,
        );
      }
    } catch (e) {
      log('Error in _navigateToNextPage: $e');
      // Default to main page if there's an error
      Navigator.of(context).pushReplacementNamed(
        MadaniRoutes.mainpageRoute,
      );
    }
  }

  void _showUpdateDialog(BuildContext context, String downloadUrl) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kemaskini Aplikasi'),
          content: const Text(
            'Versi baru aplikasi tersedia. Sila muat turun versi terkini untuk menggunakan aplikasi ini.',
          ),
          actions: [
            TextButton(
              onPressed: () async {
                try {
                  await launchUrl(
                    Uri.parse(downloadUrl),
                    mode: LaunchMode.externalApplication,
                  );
                } catch (e) {
                  log('Error launching URL: $e');
                }
              },
              child: const Text('Muat Turun'),
            ),
          ],
        );
      },
    );
  }

  void _showNetworkErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tidak Dapat Menyambung'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () async {
                // Retry network and API check
                Navigator.of(context).pop();
                await _checkVersionAndNavigate();
              },
              child: const Text('Cuba Lagi'),
            ),
            TextButton(
              onPressed: () {
                // Exit app
                exit(0);
              },
              child: const Text('Keluar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              const Color(0xFF1F10BF),
              const Color(0xFF120974),
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Top logo (Jata Negara + NACCOL Text) - center di atas
            Positioned(
              top: 60.h,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Jata Negara Logo
                    SvgPicture.asset(
                      'assets/images/Jata-Negara.svg',
                      height: 45.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10.w),
                    // Title Text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'MAJLIS TINDAKAN',
                          style: TextStyleMadani.textStyle.interText.copyWith(
                            fontSize: 12.sp,
                            color: MadaniColor.white,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'SARA HIDUP NEGARA',
                          style: TextStyleMadani.textStyle.interText.copyWith(
                            fontSize: 12.sp,
                            color: MadaniColor.white,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '(NACCOL)',
                          style: TextStyleMadani.textStyle.interText.copyWith(
                            fontSize: 12.sp,
                            color: MadaniColor.white,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Center logo (IHSAN MADANI PORTAL) - fix size di tengah
            Center(
              child: Image.asset(
                'assets/images/ihsan-madani-portal-logo.png',
                fit: BoxFit.contain,
                width: 280.w,
              ),
            ),
            // Bottom Section (Text & Button)
            if (_readyToNavigate)
              Positioned(
                bottom: 150.h,
                left: 24.w,
                right: 24.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Pelbagai usaha untuk meningkatkan kesejahteraan rakyat.',
                      style: TextStyleMadani.textStyle.interText.copyWith(
                        fontSize: 14.sp,
                        color: MadaniColor.white,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 38.h,
                      width: double.infinity,
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
                        onPressed: _navigateToNextPage,
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
                          'Cari Inisiatif',
                          style: TextStyleMadani.textStyle.interText.copyWith(
                            fontSize: 15.sp,
                            color: MadaniColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
