import 'dart:convert';

import 'package:belajar_getx/app/providers/api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var fullName = ''.obs;
  var phoneNumber = ''.obs;

  void onFullNameChanged(String value) {
    fullName.value = value;
  }

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  void onPhoneNumberChanged(String value) {
    phoneNumber.value = value;
  }

  void goToLogin() {
    // Use Get.toNamed to navigate to the register page
    Get.toNamed('/login');
  }

  Future<void> register() async {
    try {
      var response = await _performRegistration();
      var responseBody = json.decode(response.body);

      if (response.statusCode == 201) {
        _saveUserData(responseBody);
        Get.offAllNamed(
            '/login'); // Navigate to the home page after registration
      } else {
        // Registration failed, handle the error
        Get.snackbar('Error', 'Registration failed. ${responseBody['errors']}');
      }
    } catch (e) {
      // Handle other errors
      print('Error during registration: $e');
      Get.snackbar('Error', 'An error occurred during registration.');
    }
  }

  Future<http.Response> _performRegistration() async {
    var apiUrl = '/users';
    var requestBody = {
      'email': email.value,
      'password': password.value,
      'full_name': fullName.value,
      'phone_number': phoneNumber.value,
    };

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
}
