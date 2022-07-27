import 'package:flutter/material.dart';
import 'package:flutter_bootstrap2/net/flutterfire.dart';
import 'package:flutter_bootstrap2/NotesPage.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _Authentication();
}

class _Authentication extends State<Authentication> {
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: emailField,
              decoration: InputDecoration(
                hintText: "something@email.com",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                labelText: "Email",
                labelStyle: TextStyle(
                    color: Colors.white,
                )
              ),
            ),
            TextFormField(
              controller: passwordField,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  )
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate = await register(emailField.text, passwordField.text);
                  if (shouldNavigate){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          MyNotesPage(),
                      ),
                    );
                  }
                },
                child: Text ("Register"),
              )
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: MaterialButton(
                  onPressed: () async {
                    bool shouldNavigate = await signIn(emailField.text, passwordField.text);
                    if (shouldNavigate){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              MyNotesPage(),
                          ),
                      );
                    }
                  },
                  child: Text ("Login"),
                )
            ),
          ],
        ),
      ),
    );
  }
}
