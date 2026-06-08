import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madani/src/index.dart';

class CountdownPage extends StatefulWidget {
  const CountdownPage({super.key});

  @override
  State<CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  Timer? _timer;
  DateTime? _launchDate;
  Duration? _remainingTime;

  @override
  void initState() {
    super.initState();
    _loadCountdownData();
  }

  Future<void> _loadCountdownData() async {
    try {
      // Removed - API getCountdownTime() not used
      // final data = await HomeRepo().getCountdownTime();
      // Navigate directly to main page since API is not used
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(MadaniRoutes.mainpageRoute);
      }
      // if (data.launchingAt != null && data.launchingAt!.isNotEmpty) {
      //   setState(() {
      //     _launchDate = DateTime.parse(data.launchingAt!);
      //     _updateRemainingTime();
      //   });
      //   _startTimer();
      // } else {
      //   // No launch date, navigate to main page
      //   Navigator.of(context).pushReplacementNamed(MadaniRoutes.mainpageRoute);
      // }
    } catch (e) {
      log('Error loading countdown: $e');
      // If error, navigate to main page
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(MadaniRoutes.mainpageRoute);
      }
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        _updateRemainingTime();
        if (_remainingTime != null && _remainingTime!.isNegative) {
          // Countdown finished, navigate to main page
          timer.cancel();
          Navigator.of(context).pushReplacementNamed(MadaniRoutes.mainpageRoute);
        }
      }
    });
  }

  void _updateRemainingTime() {
    if (_launchDate != null) {
      final now = DateTime.now();
      setState(() {
        _remainingTime = _launchDate!.difference(now);
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${days.toString().padLeft(2, '0')}:'
        '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.media.images.countdownImage.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _remainingTime != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _formatDuration(_remainingTime!),
                      style: TextStyleMadani.textStyle.interText.copyWith(
                        fontSize: 48.sp,
                        color: MadaniColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Menunggu pelancaran...',
                      style: TextStyleMadani.textStyle.interText.copyWith(
                        fontSize: 20.sp,
                        color: MadaniColor.white,
                      ),
                    ),
                  ],
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

