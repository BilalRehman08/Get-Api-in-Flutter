import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {
  getuser() async {
    var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));

    var jsondata = jsonDecode(response.body);

    List<User> users = [];

    for (var i in jsondata) {
      User user =
          User(i['name'], i['email'], i["usernam"], i['company']['name']);
      users.add(user);
    }
    print(users);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: FutureBuilder(
                future: getuser(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(child: Text("No Data"));
                  } else
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(snapshot.data[i].a),
                            subtitle: Text(snapshot.data[i].d),
                          );
                        });
                })));
  }
}

class User {
  var a;
  var b;
  var c;
  var d;
  User(this.a, this.b, this.c, this.d);
}
