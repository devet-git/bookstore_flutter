// ignore_for_file: avoid_print

import 'package:book_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final collectionRef = FirebaseFirestore.instance.collection("users");

  Future<void> add({
    required String userId,
    required String name,
    required String email,
    Function? onSuccess,
    Function? onError,
  }) async {
    final newAccountRef = collectionRef.doc(userId);
    final newData = UserModel(
      id: userId,
      name: name,
      email: email,
    );
    return await newAccountRef.set(newData.toJson());
  }

  Future<void> update2(String userId, Map<String, Object> data) async {
    final refAccount = collectionRef.doc(userId);
    return await refAccount.update(data);
  }

  Future<void> update({
    required String userId,
    String? name,
    String? pw,
  }) async {
    Map<String, Object> newData = {};
    if (name != null && pw != null) {
      newData = {'name': name, 'password': pw};
    } else if (name != null) {
      newData = {'name': name};
    } else if (pw != null) {
      newData = {'password': pw};
    }
    final refAccount = collectionRef.doc(userId);
    return await refAccount.update(newData);
  }

  Future<void> getAll(Function onSuccess) async {
    QuerySnapshot snapshot = await collectionRef.get();
    final data = snapshot.docs.map((doc) => doc.data()).toList();
    // print(data[0]);
    return onSuccess(data);
  }

  Future<void> get(String userId, Function onSuccess) async {
    final docRef = collectionRef.doc(userId);
    return docRef.get().then(
          (snapshot) => onSuccess(snapshot.data()),
          onError: (e) => print("Error getting document: $e"),
        );
  }
}
