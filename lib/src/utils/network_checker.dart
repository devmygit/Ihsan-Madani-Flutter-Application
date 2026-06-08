import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:madani/src/utils/api_helper.dart';

class NetworkChecker {
  NetworkChecker._internal();
  static final NetworkChecker _instance = NetworkChecker._internal();
  factory NetworkChecker() => _instance;

  /// Check if device has internet connectivity
  Future<bool> hasInternetConnection() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      
      // Check if device has any network connection (WiFi, mobile, ethernet)
      if (connectivityResult.contains(ConnectivityResult.none)) {
        log('NetworkChecker: No internet connection available');
        return false;
      }

      // Additional check: Try to reach a reliable server
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          log('NetworkChecker: Internet connection verified');
          return true;
        }
      } catch (e) {
        log('NetworkChecker: Cannot reach internet - $e');
        return false;
      }

      return true;
    } catch (e) {
      log('NetworkChecker: Error checking connectivity - $e');
      return false;
    }
  }

  /// Check if API base URL is accessible by pinging the banner endpoint
  Future<bool> isApiAccessible() async {
    try {
      Dio dio = await HttpsConfig().getDio(
        visitorId: null,
        queries: {
          'page': 0,
          'per_page': 1,
        },
      );

      // Set timeout for the check (5 seconds)
      dio.options.connectTimeout = const Duration(seconds: 5);
      dio.options.receiveTimeout = const Duration(seconds: 5);

      // Try to access banner API endpoint (lightweight check)
      final response = await dio.get('/banners');

      if (response.statusCode == 200) {
        log('NetworkChecker: API is accessible');
        return true;
      } else {
        log('NetworkChecker: API returned status code ${response.statusCode}');
        return false;
      }
    } on DioException catch (e) {
      log('NetworkChecker: API not accessible - ${e.type}: ${e.message}');
      return false;
    } catch (e) {
      log('NetworkChecker: Error checking API accessibility - $e');
      return false;
    }
  }

  /// Check both network and API accessibility
  Future<NetworkCheckResult> checkNetworkAndApi() async {
    final hasInternet = await hasInternetConnection();
    
    if (!hasInternet) {
      return NetworkCheckResult(
        hasInternet: false,
        isApiAccessible: false,
        errorMessage: 'Tiada sambungan internet. Sila pastikan peranti anda disambungkan ke internet.',
      );
    }

    final apiAccessible = await isApiAccessible();
    
    if (!apiAccessible) {
      return NetworkCheckResult(
        hasInternet: true,
        isApiAccessible: false,
        errorMessage: 'Tidak dapat menyambung ke pelayan. Sila cuba lagi kemudian.',
      );
    }

    return NetworkCheckResult(
      hasInternet: true,
      isApiAccessible: true,
      errorMessage: null,
    );
  }
}

class NetworkCheckResult {
  final bool hasInternet;
  final bool isApiAccessible;
  final String? errorMessage;

  NetworkCheckResult({
    required this.hasInternet,
    required this.isApiAccessible,
    this.errorMessage,
  });

  bool get isAllGood => hasInternet && isApiAccessible;
}

