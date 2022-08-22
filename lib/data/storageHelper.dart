import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageHelper{
  StorageHelper._();
  static StorageHelper storageHelper = StorageHelper._();
  FirebaseStorage firebaseStorage=FirebaseStorage.instance;

  Future<String> uploadImage(File file)async{
    String fileName = file.path.split('/').last;
    Reference reference = firebaseStorage.ref(fileName);
    TaskSnapshot taskSnapshot = await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }
}