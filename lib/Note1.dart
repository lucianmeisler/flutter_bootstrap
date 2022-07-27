import 'package:flutter/material.dart';

class MyNotePage extends StatefulWidget {
  const MyNotePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyNotePage> createState() => _MyNotePageState();
}

class _MyNotePageState extends State<MyNotePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
