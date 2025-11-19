import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class myhome extends StatefulWidget {
  const myhome({super.key});

  @override
  State<myhome> createState() => _myhomeState();
}

class _myhomeState extends State<myhome> {
  Map<String, dynamic>? dataMap;
  Map<String, dynamic>? donedataMap;

  Future hitapi() async {
  try {
    final response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    
    if (!mounted) return;

    if (response.statusCode == 200) {
      setState(() {
        dataMap = jsonDecode(response.body);
        donedataMap = dataMap!["data"];
        print(donedataMap);
      });
    } else {
      print("Error: Status code ${response.statusCode}");
    }
  } catch (e) {
    print("Exception: $e");
  }
}

  @override
  void initState() {
    super.initState();
    hitapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Get API"),
      ),
      body: Center(
        child: donedataMap == null
            ? CircularProgressIndicator():
               ListTile(title:
                 Text( donedataMap!["first_name"].toString()+"  "+
                 donedataMap!["last_name"].toString(),
                              ),
              subtitle: Text(  donedataMap!["email"].toString(),),
              ),
            
            
      ),
    );
  }
}
