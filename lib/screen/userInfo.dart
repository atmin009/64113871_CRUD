import 'package:flutter/material.dart';
import 'package:crud/models/config.dart';
import 'package:crud/models/user.dart';
import 'package:http/http.dart' as http;

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  Future<void> removeUsers(user) async{
    var url = Uri.http(Configure.server, "users/${user.id}");
    var resp = await http.delete(url);
    print(resp.body);
    return;
  }

  @override
  Widget build(BuildContext context) {
    Users user = ModalRoute.of(context)!.settings.arguments as Users;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Info"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          child: ListView(
            children: [
              ListTile(title: Text("Full Name"), subtitle: Text("${user.fullname}")),
              ListTile(title: Text("Email"), subtitle: Text("${user.email}")),
              ListTile(title: Text("Gender"), subtitle: Text("${user.gender}")),
            ],
          ),
        ),
      ),
    );
  }
}
