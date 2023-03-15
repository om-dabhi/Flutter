import 'package:api_crud1/api_service.dart';
import 'package:api_crud1/get_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Update_Api extends StatefulWidget {
   Update_Api({Key? key}) : super(key: key);

  @override
  State<Update_Api> createState() => _Update_ApiState();
}

class _Update_ApiState extends State<Update_Api> {
  @override
   var namecontroller = TextEditingController();
   var branchcontroller = TextEditingController();
   var laptopcontroller = TextEditingController();
  late Future<List<Student>> futureAlbum;
  Api_Service api = Api_Service();
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchStudent();
  }
  Future<dynamic> updatetStudent(id) async {
    Map map = {};
    map["Name"] = namecontroller.text;
    map["Image"] = branchcontroller.text;
    map["Age"] = laptopcontroller.text;

    var response1 = await http.put(
        Uri.parse("https://640b2ba365d3a01f9812d27b.mockapi.io/Student/$id"),
        body: map);
    print(response1.body);
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
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
                decoration: InputDecoration(hintText: "Enter Student Age"),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter Student Age";
                  }
                },
                controller: laptopcontroller,
              ),
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                        updatetStudent("10");
                  },
                  child: Text("update")),
            )
          ],
        ),
      ),
    );
  }
}


