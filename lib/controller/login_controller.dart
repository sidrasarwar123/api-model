import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController with ChangeNotifier {
  TextEditingController loginemailcontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();

  GlobalKey<FormState> loginformkey = GlobalKey();

  userlogin() async {
    try {
      var header = {"Content-Type": "application/json"};

      var body = jsonEncode({
        "email": loginemailcontroller.text.trim(),
        "password": loginpasswordcontroller.text.trim(),
      });

      print("Sending Request...");
      print(body);

      http.Response response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        headers: header,
        body: body,
      );

      print("STATUS: ${response.statusCode}");
      print("RESPONSE: ${response.body}");

      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body);

        if (json["token"] != null && json["token"] != "") {
          Get.to(() => myhome());
        } else {
          print("Invalid Details");
        }
      } else {
        print("Login failed");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
