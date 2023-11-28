import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  // Future<QuerySnapshot<Map<String, dynamic>>> getPosts(String collectionPath)
  // async {
  //   return FirebaseFirestore.instance
  //   .collection(collectionPath)
  //   .orderBy('timestamp', descending: true)
  //   .get();
  // }

  // Future<void> addPost(String collectionPath, String email, String message)
  //   async {
  //     FirebaseFirestore.instance.collection(collectionPath).add({
  //       'email': email,
  //       'message': message,
  //       'timestamp': Timestamp.now(),
  //       'likes': []
  //   });
  // }

  // void likePost(String collectionPath, String id, bool isLiked, String email) {
  //   DocumentReference postRef = FirebaseFirestore.instance
  //     .collection(collectionPath).doc(id);
  //   if (isLiked) {
  //     postRef.update({
  //       'likes': FieldValue.arrayUnion([email])
  //     });
  //   } else {
  //     postRef.update({
  //       'likes': FieldValue.arrayRemove([email])
  //     });
  //   }
  // }

  Future<void> createUserData(String collectionPath, String email,
    String name, String lastname) async {
      await FirebaseFirestore.instance.collection(collectionPath)
        .doc(email)
        .set({
          'name': name,
          'lastname': lastname
        });
  }

  // Future<void> updateUserData(String collectionPath, String email,
  //   String field, String data) async {
  //     await FirebaseFirestore.instance.collection(collectionPath)
  //       .doc(email)
  //       .update({
  //         field: data
  //       });
  // }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
    String collectionPath, String email
  ) async {
    return FirebaseFirestore.instance.collection(collectionPath)
      .doc(email).get();
  }

  void clear() async {
    await FirebaseFirestore.instance.terminate();
    await FirebaseFirestore.instance.clearPersistence();
  }
}