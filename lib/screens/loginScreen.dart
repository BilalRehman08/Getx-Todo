import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Center(
              child: Container(
                child: Image.asset("assets/Logo.png"),
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300],
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[300],
                          ),
                          hintText: 'Username',
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Divider(
                        height: 10,
                        thickness: 1,
                        color: Colors.grey[200],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[300],
                          ),
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff6035D0),
                    textStyle: TextStyle(fontSize: 17)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Divider(
                      height: 10,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Divider(
                      height: 10,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "login using social media",
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              child: Image.asset("assets/google.png"),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(500)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
