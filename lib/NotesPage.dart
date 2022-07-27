import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Note1.dart';
import "addNote.dart";
import "editNote.dart";

class MyNotesPage extends StatefulWidget {
  const MyNotesPage({Key? key}) : super(key: key);


  @override
  State<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {


  //CollectionReference ref = FirebaseFirestore.instance.collection('notes');
  late Stream<QuerySnapshot> streamNotes;
  final ref = FirebaseFirestore.instance.collection('notes');

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override

  void initState() {

    super.initState();
    streamNotes = ref.snapshots();
  }



  @override
  Widget build(BuildContext context) {

    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(

      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
          onPressed:(){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>AddNote() ));
          }
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: streamNotes,
        builder: (BuildContext context, AsyncSnapshot snapshot ) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.active) {
             QuerySnapshot querySnapshot = snapshot.data;

    }


            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
              itemBuilder: (_, index) {
                return GestureDetector(

                  onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>EditNote(docToEdit: snapshot.data!.docs[index],) ));
                  },
                  child: Container(
                      margin: EdgeInsets.all(20),
                      height: 150,
                      color: Colors.grey[200],
                      child: Column(
                        children: [

                          Text(snapshot.data!.docs[index].data()['title']),
                          Text(snapshot.data!.docs[index].data()['content']),
                        ],
                      )
                  ),
                );
              },
            );
          }
      )
    );
  }
}
