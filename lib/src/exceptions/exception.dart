class StateException implements Exception {
  final String message;
  final dynamic data;

  const StateException({required this.message, this.data});

  String toString() {
    return 'StateException \nCause:$message\nSource: $data';
  }
}

class HttpException implements Exception {
  final String message;
  final dynamic data;

  const HttpException({required this.message, this.data});

  String toString() {
    return 'HttpException \nCause:$message\nSource: $data';
  }
}

class DataMapException implements Exception {
  final String message;
  final dynamic data;

  const DataMapException({required this.message, this.data});

  String toString() {
    return 'DataMapException \nCause:$message\nSource: $data';
  }
}

class RouteNotFoundException implements Exception {
  final String message;
  final dynamic data;

  const RouteNotFoundException({required this.message, this.data});

  String toString() {
    return 'DataMapException \nCause:$message\nSource: $data';
  }
}

class VideoInitializeException implements Exception {
  final String message;
  final dynamic data;

  const VideoInitializeException({required this.message, this.data});

  String toString() {
    return 'DataMapException \nCause:$message\nSource: $data';
  }
}
