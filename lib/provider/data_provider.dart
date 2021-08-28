import 'dart:convert';

import 'package:circadia/models/task_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserProvider extends GetConnect {
  Future<List<dynamic>> getUser() async {
    final response =
        await get("https://6087dddba6f4a30017425143.mockapi.io/api/todos");
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      return response.body;
    }
  }
}

Future<User> createUser(
  String id,
  String title,
  String description,
  String category,
  int timestamp,
  int priority,
  String userId,
  bool isCompleted,
) async {
  final response = await http.post(
    Uri.parse('https://6087dddba6f4a30017425143.mockapi.io/api/todos'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'timestamp': timestamp,
      'priority': priority,
      'user_id': userId,
      'isCompleted': isCompleted
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create User.');
  }
}

Future<http.Response> deleteUser(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://6087dddba6f4a30017425143.mockapi.io/api/todos/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}
