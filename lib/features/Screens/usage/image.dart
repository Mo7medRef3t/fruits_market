import 'package:firebase_storage/firebase_storage.dart';

Future<String> getImageUrl(String folderName, String productName) async {
  try {
    final storageReference = FirebaseStorage.instance
        .ref()
        .child("pictures")
        .child(folderName)
        .child("$productName.jpg");
    String downloadUrl = await storageReference.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    throw Exception("Failed to get image URL: $e");
  }
}
