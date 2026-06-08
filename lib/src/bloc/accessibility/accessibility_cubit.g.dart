// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessibility_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccessibilityState _$AccessibilityStateFromJson(Map<String, dynamic> json) =>
    _AccessibilityState(
      hide: json['hide'] as bool,
      topAccessibility: (json['top_accessibility'] as num).toDouble(),
      selectedColor: json['selected_color'] as bool,
      indexColor: (json['index_color'] as num).toInt(),
      resetColor: json['reset_color'] as bool,
      magnifierHide: json['magnifier_hide'] as bool,
      draggingX: (json['dragging_x'] as num).toDouble(),
      draggingY: (json['dragging_y'] as num).toDouble(),
      launchingStatusModel: LaunchingStatusModel.fromJson(
        json['launching_status_model'] as Map<String, dynamic>,
      ),
      dateTimeComponent: (json['dateTimeComponent'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$AccessibilityStateToJson(_AccessibilityState instance) =>
    <String, dynamic>{
      'hide': instance.hide,
      'top_accessibility': instance.topAccessibility,
      'selected_color': instance.selectedColor,
      'index_color': instance.indexColor,
      'reset_color': instance.resetColor,
      'magnifier_hide': instance.magnifierHide,
      'dragging_x': instance.draggingX,
      'dragging_y': instance.draggingY,
      'launching_status_model': instance.launchingStatusModel,
      'dateTimeComponent': instance.dateTimeComponent,
    };
