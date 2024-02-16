import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../providers/api.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  var email = ''.obs;
  var password = ''.obs;

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  Future<void> login() async {
    try {
      var response = await _performLogin();
      var responseBody = json.decode(response.body);

      if (response.statusCode == 200 && responseBody['data']['token'] != null) {
        // Login successful
        _saveUserData(responseBody);
        Get.offAllNamed('/bottom-menu'); // Navigate to the home page
      } else {
        // Login failed, handle the error
        Get.snackbar('Error', 'Login failed. ${responseBody['errors']}');
      }
    } catch (e) {
      // Handle other errors
      print('Error during login: $e');
      Get.snackbar('Error', 'An error occurred during login.');
    }
  }

  Future<http.Response> _performLogin() async {
    var apiUrl = '/merchants/login';
    var requestBody = {'email': email.value, 'password': password.value};

    return await http.post(
      Uri.parse(Api.baseUrl + apiUrl),
      body: json.encode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );
  }

  void _saveUserData(Map<String, dynamic> responseBody) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', json.encode(responseBody['data']['token']));
    localStorage.setString('user', json.encode(responseBody['data']['user']));
  }

  void goToRegister() {
    // Use Get.toNamed to navigate to the register page
    Get.toNamed('/register');
  }
}
