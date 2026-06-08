// Stub file for path_provider on web platform
// This file is used when compiling for web to avoid path_provider dependency

/// Stub for Directory class (not used on web)
class Directory {
  final String path;
  Directory(this.path);
}

/// Stub for getTemporaryDirectory (not used on web)
/// This should never be called on web as we check kIsWeb first
Future<Directory> getTemporaryDirectory() async {
  throw UnsupportedError('getTemporaryDirectory is not supported on web');
}

