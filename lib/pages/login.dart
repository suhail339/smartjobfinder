import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:jobsearcher_flutter/models/login_model.dart';
import 'package:jobsearcher_flutter/pages/dashboard.dart';

class Login extends StatelessWidget {
  static final CREATE_POST_URL =
      'http://ec2-52-15-37-169.us-east-2.compute.amazonaws.com:3000/jobsearcher/api/user/login';

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextStyle style = TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text('Job Searchers'),
        ),
        body: new Builder(builder: (BuildContext context) {
          final emailField = TextField(
            obscureText: false,
            style: style,
            controller: emailController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          );
          final passwordField = TextField(
            controller: passwordController,
            obscureText: true,
            style: style,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          );
          final loginButon = Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.blue,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: () async {
                try {
                  Response response;
                  Dio dio = new Dio();
                  FormData formData = new FormData.from({
                    "email": emailController.text.toString(),
                    "password": passwordController.text.toString()
                  });
                  response = await dio.post(CREATE_POST_URL, data: formData);
                  LoginData loginData = new LoginData.fromJson(response.data);
                  if (loginData.success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
//
              child: Text("Login",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          );
          final RegisterButon = Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.blue,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Register()),
                // );
              },
              child: Text("Register",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          );

          return Scaffold(
            body: Center(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 155.0,
                        child: Image.network(
                          "https://findmyemployment.com/blog/wp-content/uploads/2019/02/jobsearch.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45.0),
                      emailField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(
                        height: 35.0,
                      ),
                      loginButon,
                      SizedBox(
                        height: 15.0,
                      ),
                      RegisterButon,
                      SizedBox(
                        height: 15.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
