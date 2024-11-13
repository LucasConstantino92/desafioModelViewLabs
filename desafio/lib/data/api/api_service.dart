import 'dart:convert';
import 'package:desafio/domain/urls/api/url/api_url.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final Map<String, String> headers;

  ApiService()
      : headers = {
          'Content-Type': 'application/json',
          'autor': 'Lucas Constantino : lucasconstantino0102@gmail.com',
        };

  // Método GET
  Future<T?> getRequest<T>(
      String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    final url = Uri.parse('${ApiUrl.apiUrl}$endpoint');
    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final data = jsonDecode(response.body);
        return fromJson(data);
      } else {
        print('Erro GET: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Erro GET: $e');
    }
    return null;
  }

  // Método POST
  Future<T?> postRequest<T>(String endpoint, Map<String, dynamic> body,
      T Function(Map<String, dynamic>) fromJson) async {
    final url = Uri.parse('${ApiUrl.apiUrl}$endpoint');
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final data = jsonDecode(response.body);
        return fromJson({
          'data': data,
          'statusCode': response.statusCode,
        });
      } else {
        print('Erro POST: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Erro POST: $e');
    }
    return null;
  }
}
