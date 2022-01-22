import 'dart:convert';

import 'package:api_explore/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthUser extends StatelessWidget {
  const AuthUser({Key? key}) : super(key: key);

  void SignupUser(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print(data['token']);
        print(data['id']);
        print("account signup successfully");
      } else {
        print("signup failed");
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
        child: Center(
          child: ListView(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(height: 20),
              TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: "Password")),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    SignupUser(emailController.text, passwordController.text);
                    // loginUser(
                    //     emailController.text, passwordController.text, context);
                  },
                  child: Text("Login "))
            ],
          ),
        ),
      ),
    );
  }

  void loginUser(String email, String password, BuildContext context) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Failed")));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
