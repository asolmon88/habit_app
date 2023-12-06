import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FirestoreService {

  Future<QuerySnapshot<Map<String, dynamic>>> getHabits(String collectionPath)
  async {
    return await FirebaseFirestore.instance
    .collection(collectionPath)
    .get();
  }

  Future<void> addHabit(String collectionPath, String document, String name,
    String currentValue, String endValue, String metric, bool status)
    async {
      DocumentReference postRef = FirebaseFirestore.instance
        .collection(collectionPath).doc(document);
      postRef.update({
        name: {
          'current_value': currentValue,
          'end_value': endValue,
          'metric': metric,
          'status': status,
          'past_dates': {},
          'last_date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
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
      for (String element in
        ['daily_habits', 'monthly_habits', 'yearly_habits']) {
          await FirebaseFirestore.instance.collection(email)
          .doc(element)
          .set({});
        }
  }

  Future<void> updateHabit(String email, String habitType,
    String habitName, String data) async {
      await FirebaseFirestore.instance.collection(email)
        .doc(habitType)
        .update({
          '$habitName.current_value': data,
        });
  }

  Future<void> completeHabit(String email, String habitType,
    String habitName, String data, Map<String, dynamic> pastDates) async {
      await FirebaseFirestore.instance.collection(email)
        .doc(habitType)
        .update({
          '$habitName.current_value': data,
          '$habitName.past_dates': pastDates,
          '$habitName.status': true,
        });
      
  }

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