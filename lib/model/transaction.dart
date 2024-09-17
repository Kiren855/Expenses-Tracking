import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:trackizer/model/category.dart';

class Transactions {
  String uid;
  Int32 amount;
  Category category;
  String description;
  DateTime date;

  Transactions(
      {required this.uid,
      required this.amount,
      required this.category,
      required this.description,
      required this.date});

  Transactions.fromJson(Map<String, Object?> json)
      : this(
          uid: json['uid']! as String,
          amount: json['amount']! as Int32,
          category: json['category']! as Category,
          description: json['description']! as String,
          date: (json['date'] as Timestamp).toDate(),
        );

  Transactions copyWith(
      {String? uid,
      Int32? amount,
      Category? category,
      String? description,
      DateTime? date}) {
    return Transactions(
        uid: uid ?? this.uid,
        amount: amount ?? this.amount,
        category: category ?? this.category,
        description: description ?? this.description,
        date: date ?? this.date);
  }

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'amount': amount,
      'category': category,
      'description': description,
      'date': date
    };
  }

  String getWeekday() {
    return DateFormat.EEEE().format(date);
  }
}
