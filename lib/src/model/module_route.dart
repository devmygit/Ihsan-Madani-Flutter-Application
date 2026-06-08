import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_route.g.dart';
part 'module_route.freezed.dart';

@freezed
abstract class ModuleRoute with _$ModuleRoute {
  const factory ModuleRoute({
    String? currentRoute,
    String? previousRoute,
  }) = _ModuleRoute;

  factory ModuleRoute.fromJson(Map<String, dynamic> json) =>
      _$ModuleRouteFromJson(json);
}
