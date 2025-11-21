import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class myhome extends StatefulWidget {
  const myhome({super.key});

  @override
  State<myhome> createState() => _myhomeState();
}

class _myhomeState extends State<myhome> {
  List<dynamic>? donelistdata;

  Future hitapi() async {
    try {
      final response = await http.get(
        Uri.parse("https://reqres.in/api/users?page=2"),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        setState(() {
          donelistdata = decoded["data"];
        });

      debugPrint(donelistdata.toString(), wrapWidth: 2048);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      hitapi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get API"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: 
        donelistdata == null
            ? CupertinoActivityIndicator()
            : ListView.builder(
                itemCount: donelistdata!.length,
                itemBuilder: (context, index) {
                  final user = donelistdata![index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user["avatar"]),
                    ),
                    title: Text("${user["first_name"]} ${user["last_name"]}"),
                    subtitle: Text(user["email"]),
                  );
                },
              ),
      
    );
  }
}
