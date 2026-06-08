import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'app_config.dart';

class HttpsConfig {
  // Base API URL - Change this single constant to update all API calls
  static const String baseApiUrl = 'https://ihsanmadani.primuscore.com/mobile-app/MobileAppsIM/public/api/v2';

  // Get full URL for logging purposes
  static String getFullUrl(String endpoint, {Map<String, dynamic>? queryParams}) {
    String url = '$baseApiUrl$endpoint';
    if (queryParams != null && queryParams.isNotEmpty) {
      final queryString = queryParams.entries
          .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}')
          .join('&');
      url = '$url?$queryString';
    }
    return url;
  }

  Future<Dio> getDio({
    required Map<String, dynamic> queries,
    String? url,
    String? visitorId,
  }) async {
    late String moduleBaseUrl;
    if (url == null) {
      moduleBaseUrl = baseApiUrl;
    } else {
      moduleBaseUrl = '$baseApiUrl$url';
    }

    Map<String, dynamic>? headerMap = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    
    // Add Authorization header with Bearer token if API key is available
    try {
      final apiKey = await AppConfig.getApiKey();
      if (apiKey != null && apiKey.isNotEmpty) {
        headerMap['Authorization'] = 'Bearer $apiKey';
      }
    } catch (e) {
      log('Error getting API key for Authorization header: $e');
    }
    
    // Only add Visitor-ID header if visitorId is provided
    if (visitorId != null && visitorId.isNotEmpty) {
      headerMap['Visitor-ID'] = visitorId;
    }
    BaseOptions baseOptions = BaseOptions(
      baseUrl: moduleBaseUrl,
      queryParameters: queries,
      headers: headerMap,
    );

    Dio dio = Dio(baseOptions);
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          // Handle 401 Unauthorized errors (API key authentication failed)
          if (error.response?.statusCode == 401) {
            log('API Authentication failed. Please check your API key.');
            log('Error: Unauthorized - Check API key');
          }
          handler.next(error);
        },
      ),
    );

    if (kReleaseMode == false) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          compact: false,
          logPrint: (msg) {
            log(
              msg.toString(),
              name: 'api_log',
            );
          },
          responseBody: false,
        ),
      );
    }

    return dio;
  }
}

class Visitor {
  Visitor._internal();

  static final Visitor _instance = Visitor._internal();

  factory Visitor() {
    return _instance;
  }

  static String _userId = '';

  static set getId(String id) {
    _userId = id;
  }

  static String get visitorId => _userId;
}
