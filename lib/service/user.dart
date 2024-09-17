import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackizer/model/user-model.dart';

class UserService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUser(UserModel user) async {
    try {
      await _userCollection.doc(user.uid).update(user.toJson());
    } catch (e) {
      print('Error updating category: $e');
    }
  }

  Stream<List<UserModel>> getUsers() {
    return _userCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
