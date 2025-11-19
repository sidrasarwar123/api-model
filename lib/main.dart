import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: myhome(),
    );
  }
}
// class myhome extends StatefulWidget {
//   const myhome({super.key});

//   @override
//   State<myhome> createState() => _myhomeState();
// }

// class _myhomeState extends State<myhome> {
//   Future hitapi()async{
//    http.response response,
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//         title: Text(" Get API",),
//       ),
//       body: Center(child: Text(
//         "API"
//       ),),
//     );
    
//   }
// }

