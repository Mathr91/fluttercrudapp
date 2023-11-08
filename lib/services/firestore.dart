import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // un get para obtener collecion de notas de la base de datos
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  // CREATE: agregar nueva nota
  Future<void> addNote(String note, Color noteColor) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }
  // READ: get para leer las notas
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream = 
      notes.orderBy('timestamp', descending: true). snapshots();
    return notesStream;
  }

  // UPDATE: actualizar para las notas segun el id

  Future<void> updateNote(String docID, String newNote){
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }


  // DETELE: para borrar las notas segun el id

  
  Future <void> deleteNote(String docID){
    return notes.doc(docID).delete();
  }

}