// ignore_for_file: empty_constructor_bodies, prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getUser() async {
    var users = [];
    var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));
    var jsonData = jsonDecode(response.body);
    for (var i in jsonData) {
      UserModel user = UserModel(i['name'], i['username'], i['email']);
      users.add(user);
    }
    return users;
  }

  putUser()  {
    // Map user = {};
    Map user = {
    "id": 11,
    "name": "MAMA",
    "username": "Mazmi",
    "email": "abc@gmail.com",
    // "address": {
    //   "street": "Kulas Light",
    //   "suite": "Apt. 556",
    //   "city": "Gwenborough",
    //   "zipcode": "92998-3874",
    //   "geo": {"lat": "-37.3159", "lng": "81.1496"}
    // },
    // "phone": "1-770-736-8031 x56442",
    // "website": "hildegard.org",
    // "company": {
    //   "name": "Romaguera-Crona",
    //   "catchPhrase": "Multi-layered client-server neural-net",
    //   "bs": "harness real-time e-markets"
    // }
  };
    var request = http.post(Uri.https("jsonplaceholder.typicode.com", "users"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                color: Colors.cyanAccent[200],
                width: 250,
                height: 400,
                child: const Text("Nothing in Api"),
              );
              // ignore: curly_braces_in_flow_control_structures
            } else
              // ignore: curly_braces_in_flow_control_structures
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(snapshot.data![i].name),
                    subtitle: Column(
                      children: [
                        Text(snapshot.data![i].username),
                        Text(snapshot.data![i].email)
                      ],
                    ),
                  );
                },
              );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: putUser,
              child: const Text("Post Json Data"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: const BorderSide(
                      color: Colors.transparent,
                      width: 5,
                      style: BorderStyle.solid),
                  elevation: 5),
            ),
          ),
        ),
      ],
    ));
  }
}

class UserModel {
  var name, username, email;
  UserModel(this.name, this.username, this.email) {}
}

class UserPost {
  
}