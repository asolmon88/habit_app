import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  Future<QuerySnapshot<Map<String, dynamic>>> getHabits(String collectionPath)
  async {
    return await FirebaseFirestore.instance
    .collection(collectionPath)
    .get();
  }

  Future<void> addHabit(String collectionPath, String document, String name,
    double currentValue, double endValue, String metric, bool status)
    async {
      DocumentReference postRef = FirebaseFirestore.instance
        .collection(collectionPath).doc(document);
      postRef.update({
        name: {
          'current_value': currentValue,
          'end_value': endValue,
          'metric': metric,
          'status': status,
          'past_dates': []
        }
      });
  }

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