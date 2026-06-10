import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'app_config.dart';

class HttpsConfig {
  static const String _apiPath = '/mobile-app/MobileAppsIM/public/api/v2';

  static const List<String> _baseUrlHosts = [
    'https://ihsanmadani.gov.my',
    'https://ihsanmadaniv2.primuscore.com',
    'https://ihsanmadani.primuscore.com',
  ];

  static String? _resolvedBaseApiUrl;
  static bool _foundWorkingUrl = false;
  static Future<String?>? _resolveFuture;

  static String get baseApiUrl =>
      _resolvedBaseApiUrl ?? '${_baseUrlHosts.last}$_apiPath';

  static Future<String?> resolveBaseApiUrl() async {
    if (_resolvedBaseApiUrl != null) {
      return _foundWorkingUrl ? _resolvedBaseApiUrl : null;
    }

    _resolveFuture ??= _resolveBaseApiUrl();
    return _resolveFuture;
  }

  static Future<String?> _resolveBaseApiUrl() async {
    String? apiKey;
    try {
      apiKey = await AppConfig.getApiKey();
    } catch (e) {
      log('HttpsConfig: Error getting API key for base URL check: $e');
    }

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (apiKey != null && apiKey.isNotEmpty) 'Authorization': 'Bearer $apiKey',
    };

    for (final host in _baseUrlHosts) {
      final candidateUrl = '$host$_apiPath';
      try {
        final dio = Dio(
          BaseOptions(
            baseUrl: candidateUrl,
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            headers: headers,
          ),
        );

        final response = await dio.get(
          '/banners',
          queryParameters: {
            'page': 0,
            'per_page': 1,
          },
        );

        if (response.statusCode == 200) {
          _resolvedBaseApiUrl = candidateUrl;
          _foundWorkingUrl = true;
          log('HttpsConfig: Using base API URL - $candidateUrl');
          return candidateUrl;
        }

        log('HttpsConfig: Base URL returned status ${response.statusCode} - $candidateUrl');
      } catch (e) {
        log('HttpsConfig: Base URL not accessible - $candidateUrl ($e)');
      }
    }

    _resolvedBaseApiUrl = '${_baseUrlHosts.last}$_apiPath';
    _foundWorkingUrl = false;
    log('HttpsConfig: All base URLs failed, using fallback - $_resolvedBaseApiUrl');
    return null;
  }

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
    try {
      await resolveBaseApiUrl();
    } catch (e) {
      log('Error resolving base API URL: $e');
    }

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
