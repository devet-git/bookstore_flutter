import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final _storageRef = FirebaseStorage.instance.ref();
  StorageService({required this.folder});
  String folder;

  getImageUrl(String filename, Function onSuccess) async {
    final booksRef = _storageRef.child(folder);
    final imageRef = booksRef.child(filename);
    final url = await imageRef.getDownloadURL();
    return onSuccess(url);
  }
}
