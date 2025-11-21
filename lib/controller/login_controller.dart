import 'package:flutter/cupertino.dart';

class LoginController with ChangeNotifier {
  TextEditingController loginemailcontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();
  GlobalKey<FormState> loginformkey = GlobalKey();
  userlogin(
    TextEditingController loginemailcontroller,
    TextEditingController loginpasswordcontroller,
  ) {
    print(loginemailcontroller);
    print(loginpasswordcontroller);
  }
}
