import 'user.dart';

class Result {
  final int total_count;
  final bool incomplete_results;
  final List<GitUser> items;

  Result({
    required this.total_count,
    required this.incomplete_results,
    required this.items
  });

  factory Result.fromJson(dynamic json) {
    final list = json['items'] as List;
    List<GitUser> users = list.map((i) => GitUser.fromJson(i)).toList();

    return Result(
      total_count: json['id'] as int,
      incomplete_results: json['name'] as bool,
      items: users
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_count': total_count,
      'incomplete_results': incomplete_results,
      'items': items.map((item) => item.toJson()).toList(growable: false)
    };
  }

  static Result fromMap(Map<String, dynamic> map) {
    return Result(
      total_count: map['total_count'],
      incomplete_results: map['incomplete_results'],
      items: map['items']
          .map((mapping) => GitUser.fromJson(mapping))
          .toList()
          .cast<GitUser>()
    );
  }

  @override
  String toString() {
    return 'Result { id: $total_count, incomplete_results: $incomplete_results, items: $items }';
  }

  Result copyWith({
    required int total_count,
    required bool incomplete_results,
    required List<GitUser> items
  }) {
    return Result(
      total_count: total_count,
      incomplete_results: incomplete_results,
      items: items
    );
  }
}