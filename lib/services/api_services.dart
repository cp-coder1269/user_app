// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:user_app/models/RequestData.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<RequestData> getRequestData(name, email, expectedSalary) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.19:3000/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
          'email': email,
          'expectedSalary': expectedSalary,
          // Add any other data you want to send in the body
        }),
      );
      print("response: $response");
      var data = jsonDecode(response.body);
      print("data: $data");
      if (response.statusCode == 200) {
        RequestData model = RequestData.fromJson(((data["data"]["request_data"]) as List).elementAt(0));
        return model;
      }
      else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print('error: $e');
      throw Exception('Failed to post data: $e');
    }
  }
}

