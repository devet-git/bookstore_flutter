// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService({required this.collection});
  String collection;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> add({
    String? id,
    required String name,
    required String pw,
    String? role,
    Function? onSuccess,
    Function? onError,
  }) async {
    final collectionRef = _db.collection(collection);
    final docRef = collectionRef.doc();

    Map<String, dynamic> newData = [] as Map<String, dynamic>;
    return await docRef.set(newData);
  }

  Future<void> update({
    required String id,
    required Map<String, dynamic> newData,
  }) async {
    final collectionRef = _db.collection(collection);
    final docRef = collectionRef.doc(id);

    return await docRef.update(newData);
  }

  Future<void> getAllDocs(Function onSuccess) async {
    final collectionRef = _db.collection(collection);
    QuerySnapshot snapshot = await collectionRef.get();
    final data = snapshot.docs.map((doc) => doc.data()).toList();
    // print(data[0]);
    return onSuccess(data);
  }

  Future<void> getDoc(String id, Function onSuccess) async {
    final collectionRef = _db.collection(collection);
    final docRef = collectionRef.doc(id);

    return docRef.get().then(
          (snapshot) => onSuccess(snapshot.data()),
          onError: (e) => print("Error getting document: $e"),
        );
  }
}
