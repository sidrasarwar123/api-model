import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/login_controller.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/login_screen.dart' hide LoginController;
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>LoginController()),

    ],
    child:    MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:LoginScreen() 
    ) 
    
    
    
    
    );
   
  }
}


