import 'dart:convert';

import 'package:equatable/equatable.dart';

class Pagination<T> extends Equatable {
  final String path;
  final String firstPageUrl;
  final String lastPageUrl;
  final int currentPage;
  final int? from;
  final int? to;
  final int lastPage;
  final int perPage;
  final int total;
  final List<T> data;
  bool get hasNextPage => currentPage < lastPage;
  const Pagination({
    required this.path,
    required this.firstPageUrl,
    required this.lastPageUrl,
    required this.currentPage,
    required this.from,
    required this.to,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.data,
  });

  Pagination<T> copyWith({
    String? path,
    String? firstPageUrl,
    String? lastPageUrl,
    int? currentPage,
    int? from,
    int? to,
    int? lastPage,
    int? perPage,
    int? total,
    List<T>? data,
  }) {
    return Pagination<T>(
      path: path ?? this.path,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      currentPage: currentPage ?? this.currentPage,
      from: from ?? this.from,
      to: to ?? this.to,
      lastPage: lastPage ?? this.lastPage,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      data: data ?? this.data,
    );
  }

  factory Pagination.initial() {
    return const Pagination(
      path: '',
      firstPageUrl: '',
      lastPageUrl: '',
      currentPage: 0,
      from: 0,
      to: 0,
      lastPage: 0,
      perPage: 0,
      total: 0,
      data: [],
    );
  }

  factory Pagination.fromJson(String source) {
    final map = json.decode(source) as Map<String, dynamic>;
    final data = map['data'];

    return Pagination<T>.fromMap(
      map,
      data,
    );
  }

  static const _path = 'path';
  static const _firstPageUrl = 'first_page_url';
  static const _lastPageUrl = 'last_page_url';
  static const _currentPage = 'current_page';
  static const _from = 'from';
  static const _to = 'to';
  static const _lastPage = 'last_page';
  static const _perPage = 'per_page';
  static const _total = 'total';
  static const _data = 'data';

  factory Pagination.fromMap(Map<String, dynamic> map, List<T> data) {
    return Pagination<T>(
      path: map[_path] ?? '',
      firstPageUrl: map[_firstPageUrl] ?? '',
      lastPageUrl: map[_lastPageUrl] ?? '',
      currentPage: map[_currentPage] ?? 0,
      from: map[_from] ?? 0,
      to: map[_to] ?? 0,
      lastPage: map[_lastPage] ?? 0,
      perPage: map[_perPage] ?? 0,
      total: map[_total] ?? 0,
      data: data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      _path: path,
      _firstPageUrl: firstPageUrl,
      _lastPageUrl: lastPageUrl,
      _currentPage: currentPage,
      _from: from,
      _to: to,
      _lastPage: lastPage,
      _perPage: perPage,
      _total: total,
      _data: data
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        path,
        firstPageUrl,
        lastPageUrl,
        currentPage,
        from,
        to,
        lastPage,
        perPage,
        total,
        data,
      ];
}
