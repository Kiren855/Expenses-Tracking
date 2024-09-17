import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackizer/model/transaction.dart';

class TransactionService {
  final CollectionReference _transactionCollection =
      FirebaseFirestore.instance.collection('transactions');

  // Thêm mới Transaction
  Future<void> addTransaction(Transactions transaction) async {
    try {
      await _transactionCollection
          .doc(transaction.uid)
          .set(transaction.toJson());
    } catch (e) {
      print('Error adding transaction: $e');
    }
  }

  // Cập nhật Transaction
  Future<void> updateTransaction(Transactions transaction) async {
    try {
      await _transactionCollection
          .doc(transaction.uid)
          .update(transaction.toJson());
    } catch (e) {
      print('Error updating transaction: $e');
    }
  }

  // Xóa Transaction
  Future<void> deleteTransaction(String uid) async {
    try {
      await _transactionCollection.doc(uid).delete();
    } catch (e) {
      print('Error deleting transaction: $e');
    }
  }

  // Lấy danh sách tất cả Transactions (nếu cần)
  Stream<List<Transactions>> getTransactions() {
    return _transactionCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Transactions.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
