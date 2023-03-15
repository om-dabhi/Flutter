import 'dart:convert';
import 'package:api_crud1/api_service.dart';
import 'package:api_crud1/insert_api.dart';
import 'package:api_crud1/update_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Get_data extends StatefulWidget {
   Get_data({Key? key}) : super(key: key);

  @override
  State<Get_data> createState() => _Get_dataState();
}

class _Get_dataState extends State<Get_data> {
  @override
  late Future<List<Student>> futureAlbum;
  Api_Service api = Api_Service();
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchStudent();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: FutureBuilder<List<Student>>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data![9].name!);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            Container(
              child:  IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  await api.deleteStudent("10");
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              child:  IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Update_Api(),
                  ));
                },
              ),
            ),
            Container(
              child:  IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Insert_API(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Student>> fetchStudent() async {
  final response =
  await http.get(Uri.parse('https://640b2ba365d3a01f9812d27b.mockapi.io/Student'));
  if (response.statusCode == 200) {
    List<Student> listUser = [];
    List<dynamic> data=  jsonDecode(response.body);
    for(int i=0;i<data.length;i++){
      listUser.add(Student.fromJson(data[i]));
    }
    return listUser;
  } else {
    throw Exception('Failed to load album');
  }
}

class Student{
  String? id;
  String? name;
  String? branch;
  String? laptop;

  Student({this.id,this.name,this.branch,this.laptop});
  factory Student.fromJson(dynamic json) {
    return Student(
      id: json['id'],
      name: json['Name'],
      branch: json['Branch'],
      laptop: json['Laptop'],
    );
  }
}