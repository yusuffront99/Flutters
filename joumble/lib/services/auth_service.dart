import 'dart:convert';
import 'package:joumble/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // String baseUrl = 'https://611d-103-215-26-155.ngrok.io/api';

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = 'https://7771-36-75-64-127.ngrok.io/api/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal : ' + response.body);
    }
  }
}
