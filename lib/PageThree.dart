import 'package:flutter/material.dart';
import 'Note1.dart';

class MyThirdPage extends StatefulWidget {
  const MyThirdPage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyThirdPage> createState() => _MyThirdPageState();
}

class _MyThirdPageState extends State<MyThirdPage> {

  void _noteOne() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyNotePage(title: 'Note 1')),
    );
  }

  void _noteTwo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyNotePage(title: 'Note 2')),
    );
  }

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
            ElevatedButton(
              style: style,
              onPressed: _noteOne,
              child: const Text('Note 1'),
            ),
            ElevatedButton(
              style: style,
              onPressed: _noteTwo,
              child: const Text('Note 2'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

            )
          ],
        ),
      ),
    );
  }
}