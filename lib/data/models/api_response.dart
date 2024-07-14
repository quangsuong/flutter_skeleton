class ApiResponse<T> {
  final dynamic data;
  final bool success;

  ApiResponse({
    required this.data,
    required this.success,
  });

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'success': success,
    };
  }

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) create) {
    if (json['data'] is List) {
      var items =
          (json['data'] as List).map((itemJson) => create(itemJson)).toList();
      return ApiResponse<T>(
        data: items,
        success: json['success'],
      );
    } else {
      return ApiResponse<T>(
        data: create(json['data']),
        success: json['success'],
      );
    }
  }
}
