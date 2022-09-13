import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static const devName = 'Yogesh Giri';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var passValidation = 'NA';
  var loading = false;

  Future getUserDetails(String username, String password) async {
    try {
      setState(() {
        loading = true;
      });
      var url = Uri.parse('http://13.126.90.63/auth/login/');
      var response =
          await http.post(url, body: {"email": username, "password": password});
      var userDetails = jsonDecode(response.body);
      var loginStatus = response.statusCode;
      if (loginStatus == 200) {
        Navigator.pushNamed(context, MyRoutes.homeRoute);
      } else {
        setState(() {
          loading = false;
        });

        var invalidSnackBar = SnackBar(
          content: Text('Invalid Credentials'),
        );
        ScaffoldMessenger.of(context).showSnackBar(invalidSnackBar);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  var passVal = null;
  bool securedText = true;
  static const devName = 'Yogesh Giri';
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDark = (brightness == Brightness.dark) ? 1 : 0;
    var scaffold = Scaffold(
        backgroundColor: isDark == 1 ? pureBlack : pureWhite,
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 85.w,
                child: Image.asset(
                  'lib/assets/img/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                width: 80.w,
                child: Form(
                  child: Column(
                    children: [
                      Container(
                        color:
                            isDark == 1 ? Colors.grey[800] : Colors.grey[200],
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        child: TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.account_circle_outlined),
                            hintText: 'yogesh.giri@imaz.com', // placeholder
                            labelText: 'Username', // label
                            enabledBorder: InputBorder.none,
                            // errorText: 'errorText', // error
                          ),
                          validator: (value) {
                            if (value == '' || value!.isEmpty) {
                              return 'Username cannot be empty.';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        color:
                            isDark == 1 ? Colors.grey[800] : Colors.grey[200],
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: securedText,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock_outline_sharp),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    securedText = securedText ? false : true;
                                  });
                                },
                                icon: Icon(securedText
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye)),
                            hintText: 'xxxxxxxx', // placeholder
                            labelText: 'Password', // label
                            errorText:
                                passValidation != 'NA' ? passValidation : null,
                            enabledBorder: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == '' || value!.isEmpty) {
                              passVal = 'Password cannot be empty.';
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            minimumSize: Size(80.w, 45)),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          getUserDetails(usernameController.text.toString(),
                              passwordController.text.toString());
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 30,
                  child: loading
                      ? SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        )
                      : null,
                ),
              ),
              const Text(
                'Created by $devName ❤️',
                style: TextStyle(
                  height: 8,
                ),
              ),
            ],
          ),
        )));
    return scaffold;
  }
}
