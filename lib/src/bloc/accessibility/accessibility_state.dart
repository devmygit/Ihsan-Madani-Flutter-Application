// ignore_for_file: invalid_annotation_target

part of 'accessibility_cubit.dart';

@freezed
abstract class AccessibilityState with _$AccessibilityState {
  AccessibilityState._();
  factory AccessibilityState({
    required bool hide,
    @JsonKey(name: 'top_accessibility') required double topAccessibility,
    @JsonKey(name: 'selected_color') required bool selectedColor,
    @JsonKey(name: 'index_color') required int indexColor,
    @JsonKey(name: 'reset_color') required bool resetColor,
    @JsonKey(name: 'magnifier_hide') required bool magnifierHide,
    @JsonKey(name: 'dragging_x') required double draggingX,
    @JsonKey(name: 'dragging_y') required double draggingY,
    @JsonKey(name: 'launching_status_model')
    required LaunchingStatusModel launchingStatusModel,
    required List<int> dateTimeComponent,
  }) = _AccessibilityState;

  factory AccessibilityState.initial() => AccessibilityState(
      hide: true,
      topAccessibility: 0,
      selectedColor: false,
      indexColor: 0,
      resetColor: true,
      magnifierHide: true,
      draggingX: 0,
      draggingY: 0,
      launchingStatusModel: LaunchingStatusModel.initial(),
      dateTimeComponent: []);

  factory AccessibilityState.saveFromJson(Map<String, dynamic> data) {
    return AccessibilityState(
      hide: data['hide'],
      topAccessibility: data['top_accessibility'],
      selectedColor: data['selected_color'],
      indexColor: data['index_color'],
      resetColor: data['reset_color'],
      magnifierHide: data['magnifier_hide'],
      draggingX: data['dragging_x'],
      draggingY: data['dragging_y'],
      launchingStatusModel: LaunchingStatusModel.fromJson(data),
      dateTimeComponent: data['dateTimeComponent'],
    );
  }

  Map<String, dynamic> saveToJson() => {
        'hide': hide,
        'top_accessibility': topAccessibility,
        'selected_color': selectedColor,
        'index_color': indexColor,
        'reset_color': resetColor,
        'magnifier_hide': magnifierHide,
        'dragging_x': draggingX,
        'dragging_y': draggingY,
        'launching_status_model': launchingStatusModel,
        'dateTimeComponent': dateTimeComponent,
      };

  factory AccessibilityState.fromJson(Map<String, dynamic> json) =>
      _$AccessibilityStateFromJson(json);
}
