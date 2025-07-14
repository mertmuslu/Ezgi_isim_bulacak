import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _userFile async {
    final path = await _localPath;
    return File('$path/UserInfos.json');
  }

  Future<void> saveUserInfo() async {
    final file = await _userFile;

    Map<String, dynamic> newUser = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text
    };

    List<dynamic> users = [];

    if (await file.exists()) {
      String contents = await file.readAsString();
      if (contents.isNotEmpty) {
        users = json.decode(contents);
      }
    }

    users.add(newUser);
    await file.writeAsString(json.encode(users));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kayıt başarıyla eklendi')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveUserInfo,
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
