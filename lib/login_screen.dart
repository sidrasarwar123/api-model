
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginprovider=Provider.of<LoginController>(context,listen: false);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child:Consumer<LoginController>(builder:(context, loginvalues, child){
          return  Form(
key: loginvalues.loginformkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextFormField(controller: loginvalues.loginemailcontroller,
              decoration:
            
            InputDecoration(hintText: "Email"), 
            ),
            SizedBox(height: 20,),
             TextFormField(controller: loginvalues.loginpasswordcontroller,
              decoration:
            InputDecoration(hintText: "Password"), 
            ),
                SizedBox(height: 40,),
                ElevatedButton(onPressed: (){
                  if(loginvalues.loginformkey.currentState!.validate()){
                    loginvalues.userlogin(
                     loginvalues.loginemailcontroller,
                     loginvalues.loginpasswordcontroller,
                    );
                  }
                }, child: Text("Login")),
            ],
          ),
          );
        },) )
        
    
    );
  }
}