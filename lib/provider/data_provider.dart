import 'package:get/get.dart';

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


//get generate model on home from https://randomuser.me/api/?results=10
