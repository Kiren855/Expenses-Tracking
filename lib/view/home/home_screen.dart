import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/model/transaction.dart';
import 'package:trackizer/model/user.dart';
import 'package:trackizer/service/transation.dart';
import 'package:trackizer/view/detail/transaction_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showMonthPicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: selectedDate);
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String formatCurrency(int amount) {
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );
    return currencyFormat.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    final uid = user?.uid;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sổ Thu Chi', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 254, 221, 85),
      ),
      body: Column(
        children: [
          StreamBuilder<Map<String, dynamic>>(
            stream: TransactionService().getMonthlySummary(uid!, selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasData) {
                final totalExpenses = snapshot.data!['totalExpenses'] ?? 0;
                final totalIncome = snapshot.data!['totalIncome'] ?? 0;
                final balance = snapshot.data!['balance'] ?? 0;

                return Container(
                  color: const Color.fromARGB(255, 254, 221, 85),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Column(
                              children: [
                                const Text("Tháng",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18)),
                                Text(
                                    "${selectedDate.month}/${selectedDate.year}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 24)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Chi phí",
                              style: TextStyle(color: Colors.black)),
                          Text("$totalExpenses",
                              style: const TextStyle(color: Colors.black)),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Thu nhập",
                              style: TextStyle(color: Colors.black)),
                          Text("$totalIncome",
                              style: const TextStyle(color: Colors.black)),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Số dư",
                              style: TextStyle(color: Colors.black)),
                          Text("$balance",
                              style: const TextStyle(color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                );
              }

              return const Text("Không có dữ liệu");
            },
          ),
          Expanded(
            child: StreamBuilder<List<Transactions>>(
              stream: TransactionService().getTransactions(uid, selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final transactions = snapshot.data!;

                  return ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return ListTile(
                        leading: Image.asset(
                          transaction.category.icon,
                          width: 40,
                          height: 40,
                        ),
                        title: Text(transaction.category.name),
                        subtitle: Text(transaction.category.type == 'Expenses'
                            ? 'Chi phí'
                            : 'Thu nhập'),
                        trailing: Text(
                          transaction.category.type == 'Expenses'
                              ? "-${formatCurrency(transaction.amount)}"
                              : formatCurrency(transaction.amount),
                          style: TextStyle(
                            color: transaction.category.type == 'Expenses'
                                ? Colors.red
                                : Colors.green,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TransactionDetailScreen(
                                  transaction: transaction),
                            ),
                          );
                        },
                      );
                    },
                  );
                }

                return const Text("Không có giao dịch nào trong tháng này.");
              },
            ),
          ),
        ],
      ),
      // Phần còn lại của Scaffold
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, Transactions transaction) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận'),
          content: Text('Bạn có chắc muốn xóa giao dịch này không?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng hộp thoại mà không xóa
              },
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                await TransactionService().deleteTransaction(
                    transaction.id); // Gọi hàm xóa giao dịch từ Firestore
                Navigator.of(context).pop(); // Đóng hộp thoại sau khi xóa
              },
              child: Text('Xóa'),
              style: TextButton.styleFrom(
                iconColor: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }
}