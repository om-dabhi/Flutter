import 'package:api_crud1/get_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Insert_API extends StatefulWidget {
  const Insert_API({Key? key}) : super(key: key);

  @override
  State<Insert_API> createState() => _Insert_APIState();
}

class _Insert_APIState extends State<Insert_API> {
  @override
  Future<dynamic> insertStudent() async {
    Map map = {};
    map["Name"] = namecontroller.text;
    map["Branch"] = branchcontroller.text;
    map["Age"] = laptopcontroller.text;

    var response1 = await http.post(
        Uri.parse("https://640b2ba365d3a01f9812d27b.mockapi.io/Student"),
        body: map);
    print(response1.body);
    return response1;
  }
  var namecontroller = TextEditingController();
  var branchcontroller = TextEditingController();
  var laptopcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              child: TextFormField(
                decoration: InputDecoration(hintText: "Enter Student Name"),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter Student Name";
                  }
                },
                controller: namecontroller,
              ),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(hintText: "Enter Image Link"),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter Image Link";
                  }
                },
                controller: branchcontroller,
              ),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(hintText: "Enter Age"),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter Age";
                  }
                },
                controller: laptopcontroller,
              ),
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    insertStudent();
                  },
                  child: Text("Update")),
            )
          ],
        ),
    );
  }
}

