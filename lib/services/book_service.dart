// ignore_for_file: avoid_print

import 'package:book_app/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookService {
  final collectionRef = FirebaseFirestore.instance.collection("books");

  Future<void> add({
    String? id,
    required String title,
    required String status,
    required String longDescription,
    required String sortDescription,
    required List<String> authors,
    required List<String> categories,
    Function? onSuccess,
    Function? onError,
  }) async {
    // final docAcc = _db.collection("accounts");
    final newBookRef = collectionRef.doc();
    final newData = BookModel(
      id: id ?? newBookRef.id,
      title: title,
      status: status,
      longDescription: longDescription,
      sortDescription: sortDescription,
      categories: categories,
      authors: authors,
    );
    return await newBookRef.set(newData.toJson());
  }

  Future<void> getAll(Function onSuccess) async {
    QuerySnapshot snapshot = await collectionRef.get();
    final data = snapshot.docs.map((doc) => doc.data()).toList();
    // print(data[0]);
    return onSuccess(data);
  }

  Future<void> get(String bookId, Function onSuccess) async {
    final docRef = collectionRef.doc(bookId);
    return docRef.get().then(
          (snapshot) => onSuccess(snapshot.data()),
          onError: (e) => print("Error getting document: $e"),
        );
  }
}
