class PasswordResponse {
  final String password;

  PasswordResponse({required this.password});

  factory PasswordResponse.fromJson(Map<String, dynamic> json) {
    return PasswordResponse(
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'password': password,
    };
  }
}
