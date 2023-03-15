import 'dart:convert';
import 'package:api_crud1/get_data.dart';
import 'package:http/http.dart' as http;

class Api_Service{
  Future<Student> deleteStudent(String id) async {
    final http.Response response = await http.delete(
      (Uri.parse('https://640b2ba365d3a01f9812d27b.mockapi.io/Student/$id')),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Student.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to delete album.');
    }
  }
}
