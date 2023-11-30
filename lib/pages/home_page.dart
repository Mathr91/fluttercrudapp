import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();
  List<Color> noteColors = [Colors.green];
  int currentColorIndex = 0;

  void openNoteBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null) {
                firestoreService.addNote(
                  textController.text,
                  noteColors[currentColorIndex],
                );
                currentColorIndex = (currentColorIndex + 1) % noteColors.length;
              } else {
                firestoreService.updateNote(docID, textController.text);
              }

              textController.clear();
              Navigator.pop(context);
            },
            child: const Text('Agregar'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green[700],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mis notas")),
      backgroundColor: Colors.green[700],
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
        backgroundColor: Colors.green[700],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;
            return Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = notesList[index];
                    String docID = document.id;
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String noteText = data['note'];
                    Color noteColor = data['color'] ?? noteColors[0];
                    return Container(
                      decoration: BoxDecoration(
                        color: noteColor,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: noteColor.withOpacity(0.6),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(noteText),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => openNoteBox(docID: docID),
                              icon: const Icon(Icons.build),
                              color: Colors.black,
                            ),
                            IconButton(
                              onPressed: () =>
                                  firestoreService.deleteNote(docID),
                              icon: const Icon(Icons.delete_forever_sharp),
                              color: Colors.red[700],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const Center(child: Text('No hay notas'));
          }
        },
      ),
    );
  }
}
