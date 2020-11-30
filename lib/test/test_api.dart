import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:user_api/model/user.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Future<List<User>> getdata() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    var response = await http.get(url);
    var responsebody = json.decode(response.body);
    var users =
        List<User>.of((responsebody as List).map((e) => User.fromJson(e)));
    return users;
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Users'),
            centerTitle: true,
          ),
          body: FutureBuilder<List<User>>(
            future: getdata(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<User> users = snapshot.data;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              radius: 10,
                              child: Text('${users[index].id}'),
                            ),
                            title: Text(
                                'name:${users[index].name}\n'
                                    'username:${users[index].username}'),
                            subtitle: Text(
                                'email:${users[index].email}\n'
                                    'phone:${users[index].phone}\n'
                                    'website:${users[index].website}\n'
                                'adress:${users[index].address.street},${users[index].address.suite},${users[index].address.city}\n'
                                'lat:${users[index].address.geo.lat},lng:${users[index].address.geo.lng}'),
                          )
                        ],
                      ),
                      elevation: 10,
                    );
                  },
                );
              } else
                return Center(
                  child:  CircularProgressIndicator(),
                );
            },
          )),
    );
  }
}
