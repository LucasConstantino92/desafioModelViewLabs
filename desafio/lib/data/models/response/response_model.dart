class ValidateResponse {
  final String? id;
  final String message;
  final List<String>? errors;

  ValidateResponse({
    this.id,
    required this.message,
    this.errors,
  });

  factory ValidateResponse.fromJson(Map<String, dynamic> json, int statusCode) {
    if (statusCode == 202) {
      return ValidateResponse(
        id: json['data']['id'],
        message: json['data']['message'] ?? 'Password is valid',
      );
    } else if (statusCode == 400) {
      return ValidateResponse(
        message: json['data']['message'] ?? 'Password format is invalid',
        errors: List<String>.from(json['data']['errors'] ?? []),
      );
    } else if (statusCode == 422) {
      return ValidateResponse(
        message: json['data']['message'] ?? 'Invalid request payload',
      );
    } else {
      return ValidateResponse(
        message: 'Unexpected response',
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'message': message,
      if (errors != null) 'errors': errors,
    };
  }
}
